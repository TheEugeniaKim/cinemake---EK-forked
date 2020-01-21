class CreateActors < ActiveRecord::Migration[6.0]
  def change
    create_table :actors do |t|
      t.string :name
      t.string :birthday
      t.integer :gender_id
      t.string :place_of_birth
      t.string :bio

      t.timestamps
    end
  end
end
