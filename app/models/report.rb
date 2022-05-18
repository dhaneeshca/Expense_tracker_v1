class Report < ApplicationRecord
  has_many :expenses, class_name: "expense", foreign_key: "reference_id"
end
