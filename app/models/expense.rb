class Expense < ApplicationRecord
  belongs_to :status
  belongs_to :admin
  belongs_to :employee
  has_many :comment, class_name: "comment", foreign_key: "reference_id"
end
