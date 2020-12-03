class Order < ApplicationRecord
    belongs_to :end_user
    has_many :products, dependent: :destroy
    has_many :order_details, dependent: :destroy

    enum payment_method: { クレジットカード: 1, 銀行振込: 2 }
end
