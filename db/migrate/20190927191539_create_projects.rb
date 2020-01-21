class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.integer :movie_id
      t.integer :director_id
      t.string :start_date
      t.string :end_date
      t.integer :budget

      t.timestamps
    end
  end
end
