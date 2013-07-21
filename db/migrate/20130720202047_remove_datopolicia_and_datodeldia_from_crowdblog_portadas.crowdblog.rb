# This migration comes from crowdblog (originally 20130720201450)
class RemoveDatopoliciaAndDatodeldiaFromCrowdblogPortadas < ActiveRecord::Migration
  def up
    remove_column :crowdblog_portadas, :datodeldia
    remove_column :crowdblog_portadas, :datopolicia
  end

  def down
    add_column :crowdblog_portadas, :datopolicia, :string
    add_column :crowdblog_portadas, :datodeldia, :string
  end
end
