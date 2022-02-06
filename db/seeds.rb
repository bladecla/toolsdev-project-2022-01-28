require 'open-uri'

# Convert to a Unix timestamp parseable by Highcharts
# Subtract 6 hours for timezone offset rather than processing with Highcharts
def dateStringToTimestamp(dateString, hourString)
    timeArgs = *dateString.split("-") << hourString.to_i / 100, 0, 0, "-06:00"
    (Time.new(*timeArgs).to_f - 6 * 3600) * 1000 
end

# backfill 30 days of data
url = wwo_api_history_url("2022-01-01", "2022-01-31")

upsert_wwo_json_to_db_model(url)