# This migration comes from crowdblog (originally 20130201222913)
class CreateCrowdblogSectionPosts < ActiveRecord::Migration
  def change
    create_table :crowdblog_section_posts do |t|
      t.integer :home_section_id
      t.integer :post_id
      t.string :type

      t.timestamps
    end
  end
end
