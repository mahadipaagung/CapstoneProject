class OrderDetail < ApplicationRecord
    belongs_to :waste, required: false
    belongs_to :waste_order, class_name: "Order", foreign_key: "order_id", required: false

    validates :quantity, presence: true
    validates :subtotal, presence: true
    validates :unit_price, presence: true

    def add_subtotal
        self.subtotal = self.unit_price * self.quantity
    end
end
