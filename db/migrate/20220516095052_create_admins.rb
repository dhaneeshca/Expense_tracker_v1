class CreateAdmins < ActiveRecord::Migration[7.0]
  def change
    create_table :admins do |t|
      t.string :name
      t.string :password
      t.string :token

      t.timestamps
    end
  end
end
