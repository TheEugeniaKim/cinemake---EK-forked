class AddTypeToCrewMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :crew_members, :type, :string
  end
end
