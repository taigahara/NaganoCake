class Order < ApplicationRecord
    belongs_to :end_user
    has_many :order_details, dependent: :destroy
    enum payment_method: { クレジットカード: false, 銀行振込: true }
    enum status: [
        :waitng_pay,
        :confirmation_pay,
        :production,
        :preparations,
        :shipped
    ]
end