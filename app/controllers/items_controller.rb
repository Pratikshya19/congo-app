class ItemsController < ApplicationController

    def index
        @items = Item.all
        @query = params[:q]
        @categories = Category.all
        if @query
          @found_items = @items.select {|i| i.name.downcase.include? @query}
        end
      end

    def show
        @item = Item.find(params[:id])
    end




end
