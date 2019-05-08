class CategoriesController < ApplicationController

  skip_before_action :authenticated, only: [:index, :show]

    def index
        @categories = Category.all
    end
    def show
        @category = Category.find(params[:id])
        @items = Item.all
    end


end
