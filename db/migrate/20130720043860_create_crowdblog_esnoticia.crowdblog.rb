# This migration comes from crowdblog (originally 20130720040449)
class CreateCrowdblogEsnoticia < ActiveRecord::Migration
  def change
    create_table :crowdblog_esnoticia do |t|
      t.integer :tag_id

      t.timestamps
    end
  end
end
