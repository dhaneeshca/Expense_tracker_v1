class AddColumnsToExpenses < ActiveRecord::Migration[7.0]
  def change
    add_column :expenses, :comments, :string
    add_column :expenses, :extras, :string
  end
end
