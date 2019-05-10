class User < ApplicationRecord
    has_secure_password
    has_many :purchases
    has_many :items, through: :purchases
    validates :name, presence: true
    validates :email, confirmation: true
    validates :password, confirmation: true


    def categories
      c = []
      self.items.each do |item|
        c << item.category
      end
      c.uniq
    end

    def suggested_items
      Item.all.find_all do |i|
        next if self.items.include?(i)
        self.categories.include?(i.category)
      end
    end

    def has_purchases
      self.purchases != []
    end

    def has_items_without_review?
      self.items.uniq.any? do |i|
        !i.purchases.any? {|p| p.review && p.user_id == self.id}
      end
    end

    def vendor_items
      array = Item.all.find_all {|item| item.vendor_id == self.id}
      array.sort_by {|item| item.category}
    end



end








# you can add items to the cart without being logged in
# and then if you log in as a vendor you can make purchases
# we don't want vendors to be able to make purchases

# we need to make the vendors be able to edit items

# we want to be able to remove or reduce the number of items in the cart








#
