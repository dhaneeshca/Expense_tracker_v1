class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.integer :invoice_num
      t.string :category
      t.string :description
      t.integer :amount
      t.string :vendor
      t.date :exp_date
      t.references :status, null: false, foreign_key: true

      t.timestamps
    end
  end
end
