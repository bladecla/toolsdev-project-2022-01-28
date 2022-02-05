$ ->
    renderChart

renderChart ->
    Highcharts.stockChart("container", 
            title: text: "Historical High/Low"
            xAxis: 
                title: text: "Time (Hours)",
                type: "datetime"
            yAxis: 
                title:  text: "Temperate (Degrees Fahrenheit)"
            series: [
                    name: "High",
                    data: [[Date.UTC(gon.date.split("-")...), 10],[Date.UTC("2022", "00", "01", "1"),20],[Date.UTC("2022", "00", "01", "2"),15],[Date.UTC("2022", "00", "01", "3"), 32],[Date.UTC("2022", "00", "01", "4"),23]]
                ,
                    name: "Low",
                    data: [[Date.UTC("2022", "00", "01", "0"), 8],[Date.UTC("2022", "00", "01", "1"),15],[Date.UTC("2022", "00", "01", "2"),11],[Date.UTC("2022", "00", "01", "3"), 23],[Date.UTC("2022", "00", "01", "4"),18]]     
            ]
        )
    console.log(gon.date)