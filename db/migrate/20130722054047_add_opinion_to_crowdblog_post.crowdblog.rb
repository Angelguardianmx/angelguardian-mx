# This migration comes from crowdblog (originally 20130722054008)
class AddOpinionToCrowdblogPost < ActiveRecord::Migration
  def change
    add_column :crowdblog_posts, :opinion, :boolean
  end
end
