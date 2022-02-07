# Controller for the root page. Initializes the Gon gem in the view, then populates it using the WeatherChart Action Cable 

class MainController < ApplicationController
    def index 
       gon.series = WeatherChartChannel.init_series
       gon.forecast_start = get_current_hour_timestamp + 3600 * 1000 # start forecast series starting with the next hour
       gon.start_date = WeatherRecord.first.timestamp || Time.new(2022, 1, 1)
    end
end