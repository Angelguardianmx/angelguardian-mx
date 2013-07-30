# This migration comes from crowdblog (originally 20130730045528)
class AddPositionToCrowdblogSectionPosts < ActiveRecord::Migration
  def change
    add_column :crowdblog_section_posts, :position, :integer
  end
end
