# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

url = "http://api.worldweatheronline.com/premium/v1/past-weather.ashx?date=2022-01-01&enddate=2022-01-31&key=#{Rails.application.credentials.wwo[:key]}&q=30.404251,-97.849442&format=json&fx24=no&tp=1&num_of_days=3&fx=yes&mca=no&extra=utcDateTime"

backfill = JSON.parse(URI.open(url).read)
backfill = backfill["data"]["weather"]
backfill.each do |day|
    hourly = day["hourly"]
    hourly.each do |hour|
        WeatherRecord.create({
        date_time: "#{hour["UTCdate"]}-#{(hour["UTCtime"].to_i / 100).to_s}",
        temp: hour["tempF"].to_i,
        heatIndex: hour["HeatIndexF"].to_i,
        feelsLike: hour["FeelsLikeF"].to_i,
        windChill: hour["WindChillF"].to_i,
        humidity: hour["humidity"].to_i
        })
    end
end