class AddAmountSpentToProject < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :amount_spent, :integer
  end
end
