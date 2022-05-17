class Expense < ApplicationRecord
  belongs_to :status
  belongs_to :admin
  belongs_to :employee
  has_many :comment, class_name: "comment", foreign_key: "reference_id"

  has_one_attached :invoice_img
  def get_image_url
    url_for(self.invoice_img)
  end
end
