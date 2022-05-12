class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :firstname
      t.string :lastname
      t.date :dob
      t.string :phoneno
      t.string :sex
      t.date :joining_date
      t.string :department
      t.integer :salary
      t.string :email
      t.string :address
      t.references :status, null: false, foreign_key: true

      t.timestamps
    end
  end
end
