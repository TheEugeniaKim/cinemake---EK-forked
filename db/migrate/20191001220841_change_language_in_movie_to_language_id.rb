class ChangeLanguageInMovieToLanguageId < ActiveRecord::Migration[6.0]
  def change
    rename_column :movies, :language, :language_id
  end
end
