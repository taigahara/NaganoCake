class OrderDetail < ApplicationRecord
    belongs_to :product
    belongs_to :order

    enum production_status: [
        :not_proceed,
        :waiting_production,
        :production,
        :production_comp
    ]
end
