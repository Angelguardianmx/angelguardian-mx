# This migration comes from crowdblog (originally 20130129070427)
class AddImageToCrowdblogPost < ActiveRecord::Migration
  def change
    add_column :crowdblog_posts, :image, :string
  end
end
