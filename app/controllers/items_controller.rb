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

def edit
@item = Item.find(params[:id])

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
       private
       def user_params
           params.require(:item).permit(:name, :price, :category_id, :image_url)
       end



end
