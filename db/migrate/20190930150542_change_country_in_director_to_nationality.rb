class ChangeCountryInDirectorToNationality < ActiveRecord::Migration[6.0]
  def change
    rename_column :directors, :country, :nationality
  end
end
