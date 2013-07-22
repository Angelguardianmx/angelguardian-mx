# This migration comes from crowdblog (originally 20130720200529)
class AddPostIdToCrowblogWeatherNotes < ActiveRecord::Migration
  def change
    add_column :crowdblog_weather_notes, :post_id, :integer
  end
end
