class MainController < ApplicationController
    def index

        first_record = WeatherRecord.first
        three_hour = WeatherRecord.where("id % 3 = 1")

        # 2022-01-01, 0 --> JS compatible Unix timestamp
        gon.start_date = WeatherRecord.first.timestamp
        

        gon.timestamp = WeatherRecord.select("timestamp").pluck :timestamp
        gon.temp = WeatherRecord.select("temp").pluck :temp
        gon.heatIndex = three_hour.pluck :heatIndex
        gon.feelsLike = three_hour.pluck :feelsLike
        gon.windChill = WeatherRecord.select("windChill").pluck :windChill
        gon.humidity = WeatherRecord.select("humidity").pluck :humidity
    end
end