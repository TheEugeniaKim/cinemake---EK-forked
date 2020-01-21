class ChangeHireDateInRolesToDate < ActiveRecord::Migration[6.0]
  def change
    change_column :roles, :hire_date, :date
  end
end
