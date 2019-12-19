class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details, dependent: :destroy
  enum status: [:pendding, :approved, :complete, :cancelled]
end
