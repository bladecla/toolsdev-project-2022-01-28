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

def upsert_wwo_json_to_db_model(url)

    puts "Adding intervals:"
    json = JSON.parse(URI.open(url).read)
    json = json["data"]["weather"]
    json.each do |day|
        dateString = day["date"]
        hourly = day["hourly"]
        hourly.each do |hour|
            hour_string = hour["time"].to_i / 100
            date_time = "#{dateString}-#{hour_string}"
            
            puts date_time
            # WeatherRecord.upsert({
            # date_time: date_time,
            # timestamp: dateStringToTimestamp(dateString, hour_string),
            # temp: hour["tempF"].to_i,
            # heatIndex: hour["HeatIndexF"].to_i,
            # feelsLike: hour["FeelsLikeF"].to_i,
            # windChill: hour["WindChillF"].to_i,
            # humidity: hour["humidity"].to_i
            # }, unique_by: :date_time, :timestamp)
            end
        end
end