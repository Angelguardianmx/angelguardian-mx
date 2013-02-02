class RenameTypeToSectionTypeOnCrowdblogHomeSectionTable < ActiveRecord::Migration
  def change
    rename_column :crowdblog_home_sections, :type, :section_type
  end

end
