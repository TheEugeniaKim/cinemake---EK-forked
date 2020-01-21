class ChangeActorsToCrewMembers < ActiveRecord::Migration[6.0]
  def change
    rename_table :actors, :crew_members
  end
end
