class Category < ApplicationRecord
    has_many :wastes

    validates :nama, presence: true
end
