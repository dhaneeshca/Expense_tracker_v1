class Status < ApplicationRecord
    has_one :employee, class_name: "employee", foreign_key: "employee_id"
    has_one :expense, class_name: "expense", foreign_key: "expense_id"
end
