class Employee < ApplicationRecord
  belongs_to :status
  has_many :employees, class_name: "employee", foreign_key: "reference_id"
end
