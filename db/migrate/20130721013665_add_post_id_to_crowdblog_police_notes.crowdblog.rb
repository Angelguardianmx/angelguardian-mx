# This migration comes from crowdblog (originally 20130721013636)
class AddPostIdToCrowdblogPoliceNotes < ActiveRecord::Migration
  def change
    add_column :crowdblog_police_notes, :post_id, :integer
  end
end
