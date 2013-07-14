# This migration comes from crowdblog (originally 20130714014725)
class AddParentToCategories < ActiveRecord::Migration
  def change
    add_column :crowdblog_categories, :parent_id, :integer
  end
end
