require 'open-uri'
class UpsertIntervalsJob < ApplicationJob
  queue_as :default

  def perform(*args)

    # Get a timestamp for the current hour
    # Backfill any missing history and get 2 days of forecast
    # Subtract 6 hours for timezone offset rather than processing with Highcharts

    def get_date_string(interval_string)
      interval_string.split("-").slice(0,3).join("-")
    end

    last_record = WeatherRecord.last

    current_interval_timestamp = get_current_hour_timestamp / 1000
    last_interval = last_record.date_time
    last_interval_timestamp = last_record.timestamp / 1000

    hours_needed = (current_interval_timestamp - last_interval_timestamp) / 3600
    days_needed = (hours_needed / 24).ceil 

    if hours_needed >= 24
      start_date = get_date_string(last_interval) # slice the hour from the date_time. e.g. "2022-02-01-23" --> "2022-02-01"
      t = Time.now - 6 * 3600
      yyyy = t.year
      mm = t.month
      dd = t.day
      hh = t.hour
      end_date = "#{yyyy}-#{mm}-#{dd}"
      puts "\nCurrent interval is #{end_date}-#{hh}","Last database interval is #{last_interval}","Database is #{hours_needed} hours behind.","Getting #{days_needed} days of new data between #{start_date} - #{end_date}.", "\n"
      url = wwo_api_history_url(start_date, end_date)
      upsert_wwo_json_to_db_model(url)
    end

    # Generate WWO API URL, get data and populate database

    puts "Getting today's weather, plus 2 days forecast"
    url = wwo_api_forecast_url(3) 
    upsert_wwo_json_to_db_model(url)

    # Re-pluck the new series data and broadcast it via ActionCable

    ActionCable.server.broadcast "WeatherChartChannel", { message: WeatherChartChannel.init_series }

  end
end
