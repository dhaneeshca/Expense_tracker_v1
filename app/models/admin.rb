class Admin < ApplicationRecord
    has_secure_password
    has_many :admins, class_name: "admin", foreign_key: "reference_id"
end
