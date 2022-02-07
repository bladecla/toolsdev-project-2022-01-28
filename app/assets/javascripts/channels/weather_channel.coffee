App.weather_chart = App.cable.subscriptions.create "WeatherChartChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
  disconnected: ->
    # Called when the subscription has been terminated by the server
  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    console.log("refreshing chart!")
    gon.refreshChart data