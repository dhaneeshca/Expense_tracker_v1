class Expense < ApplicationRecord
  belongs_to :status
  belongs_to :admin
  belongs_to :employee
  belongs_to :report
  has_many :comment, class_name: "comment", foreign_key: "reference_id"


  validates :invoice_num, presence: true, length: { is: 6 }
  validates :description, presence: true
  validates :amount, presence: true

  has_one_attached :invoice_img
  def get_image_url
    url_for(self.invoice_img)
  end
end
