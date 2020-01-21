class AddImageToCrew < ActiveRecord::Migration[6.0]
  def change
    add_column :crew_members, :image, :string 
  end
end
