$ ->
    { start_date, forecast_start } = gon
    { temp, tempForecast, feelsLike, humidity, heatIndex } = gon.series

    gon.refreshChart = (series) ->
        console.log("refreshing chart" + series.message.temp, series)
        tempChart.series[0].setData(series.message.temp) 
        tempChart.series[1].setData(series.message.tempForecast)
        highLowChart.series[0].setData(series.message.heatIndex) 
        highLowChart.series[1].setData(series.message.feelsLike)

    Highcharts.stockChart("weather",
        title: 
            text: "Weather for Austin HQ"
        legend:
            enabled: true
        credits:
            text: "Blake Clark"
            href: "https://www.bigcommerce.com"
        xAxis: 
            title: 
                text: "Time (Hours)"
            type: "datetime"
        yAxis: 
            title:
                text: "Temperate (Degrees Fahrenheit)"
        plotOptions:
            series:
                pointStart: start_date
                pointInterval: 3600 * 1000
        series: [
                name: "Historical Temperature (F)"
                data: temp
            ,
                name: "Forecast Temperature (F)"
                data: tempForecast
                pointStart: forecast_start
        ]
    )

    Highcharts.stockChart("high-low",
        title:
            text: "3-Hour Heat Index / Feels Like"
        legend:
            enabled: true
        credits:
            text: "Blake Clark"
            href: "https://www.bigcommerce.com"
        plotOptions:
            series:
                pointStart: start_date
                pointInterval: 3 * 3600 * 1000
        xAxis: 
            title: 
                text: "Time (Hours)"
            type: "datetime"
            minTickInterval: 3 * 3600 * 1000
        yAxis: 
            title:  
                text: "Temperate (Degrees Fahrenheit)"
            alignTicks: false
        series: [
                name: "Heat Index",
                data: heatIndex
            ,
                name: "Feels like",
                data: feelsLike
        ]
    )

    tempChart = $("#weather").highcharts()
    highLowChart = $("#high-low").highcharts()