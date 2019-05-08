class Item < ApplicationRecord
    belongs_to :category
    has_many :purchases
    has_many :users, through: :purchases

    def has_reviews?
      self.purchases.any? do |p|
        p.review
      end
    end


end
