class ChangePasswordDigestToBeStringInDirectors < ActiveRecord::Migration[6.0]
  def change
    change_column :directors, :password_digest, :string
  end
end
