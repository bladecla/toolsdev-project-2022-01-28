# Represents an hour-long interval of weather records from World Weather Online

class WeatherRecord < ApplicationRecord
    validates :temp, presence: true
    validates :heatIndex, presence: true
    validates :feelsLike, presence: true
    validates :timestamp, presence: true
    validates :date_time, presence: true, uniqueness: true

    # Iterate through records once, plucking x-Axis series data for gon. 
    def self.pluck_series

        series = {}
        
        [:temp,
        :tempForecast,
        :heatIndex,
        :feelsLike,
        :windChill,
        :humidity,
        :timestamp,
        :date_time].each { |key| series[key] = [] }

        self.all.each do | record |
            if record.timestamp > get_current_hour_timestamp
                series[:tempForecast].push record.temp
            else
                series[:temp].push record.temp
            end

            is_third = record.id % 3 == 1

            series[:heatIndex].push record.heatIndex if is_third
            series[:feelsLike].push record.feelsLike if is_third
            series[:windChill].push record.windChill
            series[:humidity].push record.humidity
        end
        series
    end
end
