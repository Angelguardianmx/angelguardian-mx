# This migration comes from crowdblog (originally 20130722022623)
class AddVlogToCrowdblogPost < ActiveRecord::Migration
  def change
    add_column :crowdblog_posts, :vlog, :boolean
  end
end
