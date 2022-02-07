class WeatherChartChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "WeatherChartChannel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def self.init_series
     # Populate gon with series data to pass to Highcharts.
     series = WeatherRecord.pluck_series
  end
end
