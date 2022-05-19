class Employee < ApplicationRecord

  validates :firstname, presence: true, length: { minimum: 2, maximum: 35 }
  validates :lastname, presence: true, length: { maximum: 35 }
  validates :salary, presence:true
  validates :email, presence: true, uniqueness: true

  belongs_to :status
  has_many :expenses
end
