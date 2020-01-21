class DeleteDirectorIdFromProjects < ActiveRecord::Migration[6.0]
  def change
    remove_column :projects, :director_id
  end
end
