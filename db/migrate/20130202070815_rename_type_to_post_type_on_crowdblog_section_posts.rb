class RenameTypeToPostTypeOnCrowdblogSectionPosts < ActiveRecord::Migration
  def change
    rename_column :crowdblog_section_posts, :type, :post_type
  end
end
