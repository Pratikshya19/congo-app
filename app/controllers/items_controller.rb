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
def new
    @item = Item.new
end


    def create
        
@item= Item.new(item_params)
@item = Item.valid?
@item.save
redirect_to item_path(@item)
end




  def edit
    @item = Item.find(params[:id])
  end


  def add_to_cart
      @item = Item.find(params[:id])

      current_cart << @item.id
  end

  def update
      @item = Item.update(item_params)
  end


  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to items_path
  end



  private

    def item_params
      params.require(:item).permit(:name, :price, :category_id, :image_url)
    end



end
