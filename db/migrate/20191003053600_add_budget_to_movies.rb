class AddBudgetToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :budget, :integer
  end
end
