class ItemsController < ApplicationController
    skip_before_action :authenticated
    
    def index
        @items = Item.all
        # @order_item = current_order.order_items.new
        @query = params[:q]
        @categories = Category.all
        if @query
          @found_items = @items.select {|i| i.name.downcase.include? @query}
        end
      end

    def show
        @item = Item.find(params[:id])
    end


    def create
        # @order = current_order
        # @item = @order.order_items.new(item_params)
        @order.save
        session[:order_id] = @order.id
        redirect_to items_path
      end
    




def edit
@item = Item.find(params[:id])

end

def add_to_cart
    # Get the item from the path
    @item = Item.find(params[:id])
   
    # Load the cart from the session, or create a new empty cart.
    cart << @item
  end

# def add_to_cart
    
#     @item = Item.find(params[:id])
   

#     cart = session[:cart] || []
#     cart << @item.id
   
#     session[:cart] = cart
#   end

def update
    @item = Item.update(item_params)
end


def destroy
        @user = User.find(params[:id])
         @user.destroy
         redirect_to items_path
       end
       
       
       
  private     
       private
       def item_params
           params.require(:item).permit(:name, :price, :category_id, :image_url)
       end



end
