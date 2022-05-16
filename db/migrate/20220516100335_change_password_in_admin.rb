class ChangePasswordInAdmin < ActiveRecord::Migration[7.0]
  def change
    remove_column :admins, :password, :string
    add_column :admins, :password_digest, :string
  end
end
