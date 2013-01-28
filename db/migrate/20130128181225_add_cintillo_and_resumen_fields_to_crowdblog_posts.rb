class AddCintilloAndResumenFieldsToCrowdblogPosts < ActiveRecord::Migration
  def change
    add_column :crowdblog_posts, :cintillo, :text
    add_column :crowdblog_posts, :resumen, :text
  end
end
