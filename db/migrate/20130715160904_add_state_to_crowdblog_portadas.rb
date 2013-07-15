class AddStateToCrowdblogPortadas < ActiveRecord::Migration
  def change
    add_column :crowdblog_portadas, :state, :string
  end
end
