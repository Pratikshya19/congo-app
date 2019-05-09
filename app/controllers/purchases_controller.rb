class PurchasesController < ApplicationController


    def show
      @purchase = Purchase.find(params[:id])
    end

    def review
      @purchase = Purchase.find(params[:id])
    end

    def update
      @purchase = Purchase.find(params[:id])
      @purchase.update(review: params[:purchase][:review])
      redirect_to item_path(@purchase.item)
    end

    def create
      current_cart.each do |num|
        Purchase.create(user_id: session[:user_id], item_id: num)
      end
      session.delete(:cart)
      redirect_to user_path(session[:user_id])
    end


end
