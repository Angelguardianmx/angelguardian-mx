# This migration comes from crowdblog (originally 20130201221008)
class CreateCrowdblogPortadas < ActiveRecord::Migration
  def change
    create_table :crowdblog_portadas do |t|
      t.integer :breaking_news
      t.date :publication

      t.timestamps
    end
  end
end
