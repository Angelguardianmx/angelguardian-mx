# This migration comes from crowdblog (originally 20130128202306)
class CreateCrowdblogCategory < ActiveRecord::Migration
  def change
    create_table :crowdblog_category do |t|
      t.text :name

      t.timestamps
    end
  end
end
