# This migration comes from crowdblog (originally 20130724055924)
class AddFieldsToCrowdblogCategories < ActiveRecord::Migration
  def change
    add_column :crowdblog_categories, :header, :boolean
    add_column :crowdblog_categories, :footer, :boolean
  end
end
