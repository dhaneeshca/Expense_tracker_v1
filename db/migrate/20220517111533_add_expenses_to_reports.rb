class AddExpensesToReports < ActiveRecord::Migration[7.0]
  def change
    add_reference :expenses, :report, null: false, foreign_key: true
  end
end
