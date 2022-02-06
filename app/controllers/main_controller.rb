# Controller for the root page. Passes database records to Highcharts via the Gon gem. 

class MainController < ApplicationController
    def index

        # JS compatible Unix timestamps

        current_interval_timestamp = get_current_hour_timestamp

        # Initialize gon

        gon.forecast_start = current_interval_timestamp + 3600 * 1000 # start forecast series starting with the next hour
        gon.start_date = WeatherRecord.first.timestamp
        gon.temp = []
        gon.tempForecast = []
        gon.heatIndex = []
        gon.feelsLike = []
        gon.windChill = []
        gon.humidity = []

        # Iterate through records once, filling x-Axis series data in gon. 

        WeatherRecord.all.each do | record |
            if record.timestamp > current_interval_timestamp
                gon.tempForecast.push(record.temp)
            else
                gon.temp.push(record.temp)
            end

            gon.heatIndex.push(record.heatIndex) if record.id % 3 == 1
            gon.feelsLike.push(record.feelsLike) if record.id % 3 == 1
            gon.windChill.push(record.windChill)
            gon.humidity.push(record.humidity)
        end
    end
end