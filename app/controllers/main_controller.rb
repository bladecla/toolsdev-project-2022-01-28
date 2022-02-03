class MainController < ApplicationController
    def index
        @api_key = Rails.application.credentials.wwo[:key]
    end
end