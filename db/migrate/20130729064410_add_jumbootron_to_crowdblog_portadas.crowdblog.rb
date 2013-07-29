# This migration comes from crowdblog (originally 20130729064141)
class AddJumbootronToCrowdblogPortadas < ActiveRecord::Migration
  def change
    add_column :crowdblog_portadas, :jumbotron, :text
  end
end
