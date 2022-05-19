class AddApiKeytoEmployees < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :api_key, :string, :default => ""
  end
end
