class ChangeActorIdInRolesToPersonId < ActiveRecord::Migration[6.0]
  def change
    rename_column :roles, :actor_id, :person_id
  end
end
