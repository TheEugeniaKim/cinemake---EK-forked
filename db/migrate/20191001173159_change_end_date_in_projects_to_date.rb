class ChangeEndDateInProjectsToDate < ActiveRecord::Migration[6.0]
  def change
    change_column :projects, :end_date, :date
  end
end
