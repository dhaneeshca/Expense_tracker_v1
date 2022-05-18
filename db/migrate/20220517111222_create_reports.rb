class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.string :title
      t.integer :applied_amt
      t.integer :reimb_amt

      t.timestamps
    end
  end
end
