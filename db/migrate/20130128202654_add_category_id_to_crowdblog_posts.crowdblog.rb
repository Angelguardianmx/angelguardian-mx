# This migration comes from crowdblog (originally 20130128202538)
class AddCategoryIdToCrowdblogPosts < ActiveRecord::Migration
  def change
    add_column :crowdblog_posts, :category_id, :integer
  end
end
