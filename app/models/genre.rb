class Genre < ApplicationRecord
  acts_as_paranoid

  has_many :products, dependent: :destroy
  enum is_invalid: { 無効: false, 有効: true }
end
