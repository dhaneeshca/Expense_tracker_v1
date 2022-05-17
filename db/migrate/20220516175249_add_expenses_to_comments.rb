class AddExpensesToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :expense, null: false, foreign_key: true
  end
end
