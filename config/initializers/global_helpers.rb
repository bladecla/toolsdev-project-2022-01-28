require 'open-uri'

def wwo_api_forecast_url(num_of_days)
    "http://api.worldweatheronline.com/premium/v1/weather.ashx?key=#{Rails.application.credentials.wwo[:key]}&q=30.404251,-97.849442&format=json&fx24=no&tp=1&fx=yes&mca=no&extra=utcDateTime&num_of_days=#{num_of_days}"
end

def wwo_api_history_url(start_date, end_date)
    "http://api.worldweatheronline.com/premium/v1/past-weather.ashx?date=#{start_date}&enddate=#{end_date}&key=#{Rails.application.credentials.wwo[:key]}&q=30.404251,-97.849442&format=json&fx24=no&tp=1&fx=yes&mca=no&extra=utcDateTime"
end

def dateStringToTimestamp(dateString, hourString)
    timeArgs = *dateString.split("-") << hourString, 0, 0, "-06:00"
    (Time.new(*timeArgs).to_f - 6 * 3600) * 1000 
end

# Adjust -6 for timezone to make Highcharts happy

def get_current_hour_timestamp
    t = Time.now - 6 * 3600
    yyyy = t.year
    mm = t.month
    dd = t.day
    hh = t.hour
    Time.new(yyyy, mm, dd, hh, 0, 0, "-06:00").to_f * 1000
end

def upsert_wwo_json_to_db_model(url, seeding=false)

    puts "Attempting to add intervals:"
    json = JSON.parse(URI.open(url).read)
    json = json["data"]["weather"]
    json.each do |day|
        dateString = day["date"]
        hourly = day["hourly"]
        hourly.each do |hour|
            hour_string = hour["time"].to_i / 100
            date_time = "#{dateString}-#{hour_string}"
            timestamp = dateStringToTimestamp(dateString, hour_string)
            
            # Don't add records 48 hrs + in the future
            if seeding || (timestamp - get_current_hour_timestamp <= 48 * 3600 * 1000)
                puts date_time
                WeatherRecord.find_or_create_by({
                date_time: date_time,
                timestamp: timestamp,
                temp: hour["tempF"].to_i,
                heatIndex: hour["HeatIndexF"].to_i,
                feelsLike: hour["FeelsLikeF"].to_i,
                windChill: hour["WindChillF"].to_i,
                humidity: hour["humidity"].to_i
                })
            else
                puts "Not adding interval #{date_time} as it is more than 48 hours in the future"
            end
        end
    end
end