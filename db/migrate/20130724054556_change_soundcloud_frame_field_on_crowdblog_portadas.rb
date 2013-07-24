class ChangeSoundcloudFrameFieldOnCrowdblogPortadas < ActiveRecord::Migration
  def change
    change_column :crowdblog_portadas, :soundcloud_frame, :text
  end
end
