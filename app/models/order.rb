class Order < ApplicationRecord
    has_many :order_details
    has_many :wastes, through: :order_details
    belongs_to :penyalur
    belongs_to :pengumpul

    def add_waste(wastes)
        wastes.each do |waste|
            if Waste.find_by_id(waste[:id]).present?
                self.order_details << OrderDetail.new(waste_id: waste[:id], quantity: waste[:quantity], unit_price: Waste.find_by_id(waste[:id]).harga)
            else
                self.errors.add(:waste, "tidak ada data sampah")
            end
        end
    end

    def add_subtotal
        self.order_details.each do |order_detail|
            order_detail.add_subtotal
        end
    end

    def add_total_price
        self.order_details.each do |order_detail|
            self.total = self.total + order_detail.subtotal
        end
    end
end
