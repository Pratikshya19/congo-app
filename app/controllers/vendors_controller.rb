class VendorsController < ApplicationController


    def show
       return head(:forbidden) unless session.include> :vendor_id
       @item = Item.find(params[:id])
    end

    # def index
    #     return head 
    # end

    
    def new
        @item = Item.new
    end

  

    def require_login
        return head(:forbidden) unless session.include? :vendor_id
end