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


end
