# Represents an hour-long interval of weather records from World Weather Online

class WeatherRecord < ApplicationRecord
    validates :temp, presence: true
    validates :heatIndex, presence: true
    validates :feelsLike, presence: true
    validates :date_time, presence: true, uniqueness: true
    validates :timestamp, presence: true, uniqueness: true
end
