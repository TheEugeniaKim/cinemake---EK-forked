class AddAbbreviationToLanguages < ActiveRecord::Migration[6.0]
  def change
    add_column :languages, :abbreviation, :string
  end
end
