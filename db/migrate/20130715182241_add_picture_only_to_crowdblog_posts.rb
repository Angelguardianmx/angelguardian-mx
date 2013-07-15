class AddPictureOnlyToCrowdblogPosts < ActiveRecord::Migration
  def change
    add_column :crowdblog_posts, :picture_only, :boolean
  end
end
