class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :synopsis
      t.integer :release_year
      t.string :production_company
      t.string :language

      t.timestamps
    end
  end
end
