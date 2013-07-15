class AddRelatedIdToCrowdblogPost < ActiveRecord::Migration
  def change
    add_column :crowdblog_posts, :related_id, :integer
  end
end
