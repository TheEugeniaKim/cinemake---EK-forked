class ChangeCastingsToRoles < ActiveRecord::Migration[6.0]
  def change
    rename_table :castings, :roles
  end
end
