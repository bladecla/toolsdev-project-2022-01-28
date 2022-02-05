class CreateWeatherRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :weather_records do |t|
      t.string :date_time
      t.integer :temp
      t.integer :heatIndex
      t.integer :feelsLike
      t.integer :windChill
      t.integer :humidity

      t.timestamps
    end
  end
end
