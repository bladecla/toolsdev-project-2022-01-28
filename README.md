# Blake Clark
## Tools Dev Project 2022-01-28

### What it does

+ This feature adds two weather charts dating back to 01-01-2022. The first chart has a series for historical temperatures and one for 2 days of forecast
+ Uses the WorldWeatherOnline API for data
+ This API no longer supports high/low temperatures at the 3-hour level, so instead the second chart uses Feels Like/ Heat Index data
+ The chart should update every 30 minutes, adding new time intervals to the database and updating the chart in real time.

### How it works

This feature adds one main#index route.
This route calls the WeatherChartChannel ActionCable, which has a class method that queries the WeatherRecord model. 
This gives wide access to the WeatherRecord model which in turn owns a class method for plucking each field into 1-hour and 3-hour interval arrays for Highcharts to consume
The ActionCable then sends a message to the client browser, triggering updates to Highcharts via the Gon gem.

### Conclusion

I had fun learning Ruby + RoR over the last week and a half, and I've learned quite a lot that is already ready proving to be useful knowledge in my career going forward. I spent quite a lot of time on environment config, which did not leave much time for development, which has also taught me a valuable lesson about using Docker whenever appropriate. 

Thanks for your time and allowing me to participate in this project! 
