class Product < ApplicationRecord
  belongs_to :categorie
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :order_details, dependent: :destroy
end
