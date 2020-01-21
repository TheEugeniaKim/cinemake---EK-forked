class CreateProjectCrewMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :project_crew_members do |t|
      t.string :crew_member_id
      t.string :project_id

      t.timestamps
    end
  end
end
