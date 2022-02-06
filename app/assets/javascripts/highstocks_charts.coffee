$ ->
    { start_date, temp, feelsLike, humidity, heatIndex } = gon

    Highcharts.setOptions(
        time: 
            timezone: "America/Chicago"
    )

    Highcharts.stockChart("weather",
        title: text: "Weather for Austin HQ"
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
                name: "Temperature (F)"
                data: temp
        ]
    )

    Highcharts.stockChart("high-low",
        title:
            text: "3-Hour Heat Index / Feels Like"
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