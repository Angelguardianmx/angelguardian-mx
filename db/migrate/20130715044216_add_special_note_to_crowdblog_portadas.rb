class AddSpecialNoteToCrowdblogPortadas < ActiveRecord::Migration
  def change
    add_column :crowdblog_portadas, :special_note_id, :integer
  end
end
