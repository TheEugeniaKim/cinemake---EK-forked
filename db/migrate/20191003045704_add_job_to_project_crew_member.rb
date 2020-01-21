class AddJobToProjectCrewMember < ActiveRecord::Migration[6.0]
  def change
    add_column :project_crew_members, :job, :string
  end
end
