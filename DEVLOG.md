# Dev Log

## Jan 28 - Feb 1

### Environment Config

* Tried configuring on Windows with WSL + Debian
* Installed Ubuntu alongside windows
* Installed IDE

## Feb 2 2022

* Installed global dependencies
    + ruby
    + git
    + rvm
    + postgresql
    + nodejs

## Feb 3 2022

### Project config

* Forked project
* db password ENV variable
* Install/configure local dependencies
    + Boostrap CSS/JS
    + main#index
    + Generated WWO API Key and concealed with rails credentials:edit
    + Exposed the API Key to main#index
    + clockwork gem
    + highstock-rails gem --*NOTE*: Removed highstock/highcharts-more from JS manifest
    + rest-client gem
    + Found WWO API does not include hourly high/lows as part of any of their responses.

### Development

* BigCommerce favicon
* BigCommerce logo + href
* Added config/initializers/constants.rb for API URL

TODO: Decide between Gon + rabl, javascript_tag, data tags;

## Feb 4 2022

* Tested out using javascript_tag + coffeescript to render Highstocks chart
* Decided on gon to keep business logic out of the view
* Generated WeatherRecord model
* Decided on open-uri gem vs. rest-client for HTTP
* Used WWO Local History API + open_uri + db:seed to backfill 30 days of data
* date_time column is in UTC parseable format YYYY-MM-DD-H(H) for JavaScript
* exposed db WeatherRecords to CoffeScript via Gon to render in Highstocks chart

TODO: 
    * Move from passing [x,y] tuples in Highcharts to pre-processed flat arrays from Gon.
    * Set pointStart to WeatherRecords.first date time

## Feb 5 2022

* re-seeded db to use JS compatible Unix timestamps
* pluck db values for each column on WR model and pass as an array to Gon
* Set pointStart with WR.first.date_time
* Swapped out 3hr High/Low with Heat Index/ Feels Like since this data is only available at the daily level
* re-seeded to add move date_time to strings for easy debugging, unix is now the timestamp field
* filtered records to get true 3-hour intervals
* setup dev_clockwork.db with a basic UpdateIntervalJob < ActiveJob to query for new data
* Added much-needed validations to the WR model
* Abstracted URL building, timestamp conversion and record upsert methods into constants.rb
* Refactored main#index to only iterate over the data once. Sorts temperatures into historical/forecast
* Added the forecast series to the 1-hr historical chart
* Fixed an arg out of range bug in current timestamp helper
* Added logic to not update intervals past 48 hours forecast

## Feb 6 2022

* Renamed constants.rb to global_helpers.rb
* Attempted to set up live reload with 
    + EventSource
    + Redis SubPub
    + Did not get to try ActionCable
* Deployed to Heroku