class Product < ApplicationRecord
  
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  attachment :image
  enum is_sold: { 販売停止中: false, 販売中: true }
end