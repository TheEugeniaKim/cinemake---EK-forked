class AddDirectorIdToProjectCrewMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :project_crew_members, :director_id, :integer
  end
end
