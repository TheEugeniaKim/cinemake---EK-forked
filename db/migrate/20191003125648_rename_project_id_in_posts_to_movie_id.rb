class RenameProjectIdInPostsToMovieId < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :project_id, :movie_id
  end
end
