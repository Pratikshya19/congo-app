class Item < ApplicationRecord
    belongs_to :category
    has_many :purchases
    has_many :users, through: :purchases
    validates :name, presence: true
    validates :price, presence: true
    validates :category, presence: true
    validates :vendor_id, presence: true



    def has_reviews?
      self.purchases.any? do |p|
        p.review
      end
    end


end
