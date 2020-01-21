class ChangeTypeInCrew < ActiveRecord::Migration[6.0]
  def change
    rename_column :crew_members, :type, :crew_member_type 
  end
end
