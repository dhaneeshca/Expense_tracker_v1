class AddMailFlagToReports < ActiveRecord::Migration[7.0]
  def change
    add_column :reports, :mail_flag, :integer, :default =>0
    change_column :reports, :applied_amt, :integer, :default =>0
    change_column :reports, :reimb_amt, :integer, :default =>0
  end
end
