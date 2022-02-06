require 'open-uri'
class UpsertIntervalsJob < ApplicationJob
  queue_as :default

  def perform(*args)

    # Convert to a Unix timestamp parseable by Highcharts
    # Subtract 6 hours for timezone offset rather than processing with Highcharts

    t = Time.now
    yyyy = t.year
    mm = t.month
    dd = t.day
    hh = t.hour - 6
    
    last_record = WeatherRecord.last

    current_interval_timestamp = Time.new(yyyy, mm, dd, hh, 0, 0, "-06:00").to_f
    last_interval = last_record.date_time
    last_interval_timestamp = last_record.timestamp / 1000

    hours_needed = (current_interval_timestamp - last_interval_timestamp) / 3600
    days_needed = (hours_needed / 24).ceil
    
    start_date = last_interval.split("-").slice(0,3).join("-") # slice the hour from the date_time. e.g. "2022-02-01-23" --> "2022-02-01"
    end_date = "#{yyyy}-#{mm}-#{dd}"

    puts "\nCurrent interval is #{end_date}-#{hh}","Last database interval is #{last_interval}","Database is #{hours_needed} hours behind.", "Getting #{days_needed} days of new data between #{start_date} - #{end_date}, plus 2 days forecast.", "\n"

    url = wwo_api_history_url(start_date, end_date)
    upsert_wwo_json_to_db_model(url)

    url = wwo_api_forecast_url(2)
    upsert_wwo_json_to_db_model(url)

  end
end
