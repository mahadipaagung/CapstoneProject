class Waste < ApplicationRecord
    has_many :order_details
    has_many :orders, through: :order_details

    belongs_to :category
end
