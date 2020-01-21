class ChangeLanguageIdInMoviesToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :movies, :language_id, :integer
  end
end
