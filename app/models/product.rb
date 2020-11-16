class Product < ApplicationRecord
  
  belongs_to :genre
  attachment :image
  enum is_sold: { 販売停止中: false, 販売中: true }
end