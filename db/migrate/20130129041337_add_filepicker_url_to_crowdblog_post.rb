class AddFilepickerUrlToCrowdblogPost < ActiveRecord::Migration
  def change
    add_column :crowdblog_posts, :filepicker_url, :string
  end
end
