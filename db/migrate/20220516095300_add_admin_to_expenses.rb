class AddAdminToExpenses < ActiveRecord::Migration[7.0]
  def change
    add_reference :expenses, :admin, null: false, foreign_key: true#null: true for optional
  end
end
