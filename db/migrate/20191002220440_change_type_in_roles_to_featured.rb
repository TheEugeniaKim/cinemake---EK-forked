class ChangeTypeInRolesToFeatured < ActiveRecord::Migration[6.0]
  def change
    rename_column :roles, :type, :featured?
    change_column :roles, :featured?, :boolean
  end
end
