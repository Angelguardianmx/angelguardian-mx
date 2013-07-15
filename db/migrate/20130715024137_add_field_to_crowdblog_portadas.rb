class AddFieldToCrowdblogPortadas < ActiveRecord::Migration
  def change
    add_column :crowdblog_portadas, :datodeldia, :string
  end
end
