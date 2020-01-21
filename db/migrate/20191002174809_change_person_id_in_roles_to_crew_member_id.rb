class ChangePersonIdInRolesToCrewMemberId < ActiveRecord::Migration[6.0]
  def change
    rename_column :roles, :person_id, :crew_member_id
  end
end
