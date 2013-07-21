# This migration comes from crowdblog (originally 20130721013626)
class AddPostIdToCrowdblogDodNotes < ActiveRecord::Migration
  def change
    add_column :crowdblog_dod_notes, :post_id, :integer
  end
end
