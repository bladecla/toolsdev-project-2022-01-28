class MainController < ApplicationController
    def index
        @all = WeatherRecord.all
    end
end