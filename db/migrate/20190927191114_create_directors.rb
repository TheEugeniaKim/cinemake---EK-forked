class CreateDirectors < ActiveRecord::Migration[6.0]
  def change
    create_table :directors do |t|
      t.string :name
      t.integer :age
      t.string :country
      t.string :username
      t.integer :password_digest
      t.string :image
      t.string :email

      t.timestamps
    end
  end
end
