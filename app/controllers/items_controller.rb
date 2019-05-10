class ItemsController < ApplicationController
    skip_before_action :authenticated
    skip_before_action :verify_authenticity_token
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
      @item= Item.new(name: params[:name], price: params[:price], category_id: params[:category_id])
      @item.vendor_id = current_user.id
      if @item.valid?
      @item.save
      redirect_to user_path(@item.vendor_id)
      else
      redirect_to user_path
      end
    end




  def edit
    @item = Item.find(params[:id])
  end


  def add_to_cart
      @item = Item.find(params[:id])
      current_cart << @item.id
      render :index

  end

  def update
      @item = Item.update(item_params)
  end


  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to user_path(@item.vendor_id)
  end



  private

    def item_params
      params.require(:item).permit(:name, :price, :category_id)
    end



end
