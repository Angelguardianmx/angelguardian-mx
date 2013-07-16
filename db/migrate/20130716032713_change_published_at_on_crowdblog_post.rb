class ChangePublishedAtOnCrowdblogPost < ActiveRecord::Migration
  def change
    change_column :crowdblog_posts, :published_at, :datetime
  end
end
