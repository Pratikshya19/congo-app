class User < ApplicationRecord
    has_many :purchases
    has_many :items, through: :purchases
validates :name, presence: true
validates :email, confirmation: true
validates :password, confirmation: true


    def categories
      c = []
      items.each do |item|
        c << item.category
      end
      c.uniq
    end

    def suggested_items
      items = []
      Items.all.each do |item|
        unless item.users.include?(self.id)
        end
      end
    end
    


end
