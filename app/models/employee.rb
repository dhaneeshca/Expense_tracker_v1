class Employee < ApplicationRecord
  belongs_to :status
  has_many :expenses
end
