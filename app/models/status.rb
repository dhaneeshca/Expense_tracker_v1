class Status < ApplicationRecord
    has_one :employee
    has_one :expense
end
