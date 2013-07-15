class AddSoundcloudeFrameToCrowdblogPortadas < ActiveRecord::Migration
  def change
    add_column :crowdblog_portadas, :soundcloud_frame, :string
  end
end
