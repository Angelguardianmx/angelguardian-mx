class AddDatoPoliciasToCrowdblogPortadas < ActiveRecord::Migration
  def change
    add_column :crowdblog_portadas, :datopolicia, :string
  end
end
