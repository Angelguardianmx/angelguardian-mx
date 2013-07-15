class AddResumenOnTopToCrowdblogPortadas < ActiveRecord::Migration
  def change
    add_column :crowdblog_portadas, :resumen_on_top, :boolean
  end
end
