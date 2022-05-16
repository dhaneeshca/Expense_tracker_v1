class Expense < ApplicationRecord
  belongs_to :status
  belongs_to :admin
end
