class Vendor < ApplicationRecord
    has_many :items
    has_many :categories, through: :items
end
