class RenameFeaturedInRolesToFeatured < ActiveRecord::Migration[6.0]
  def change
    rename_column :roles, :featured?, :featured
  end
end
