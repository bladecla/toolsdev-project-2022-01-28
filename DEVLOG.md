# Dev Log

## Jan 28 - Feb 1

### Environment Config

* Installed Linux
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
* Decided on gon to allow for more Ruby processing