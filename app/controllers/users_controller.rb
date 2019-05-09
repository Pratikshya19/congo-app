class UsersController < ApplicationController
    # skip_before_action :verify_authenticity_token
    skip_before_action :authenticated, only: [:new, :create]



  def show
    @items = Item.all
    @categories = Category.all
    if logged_in?
      @user = User.find(params[:id])
    else
      redirect_to login_path
    end
  end

  def new
    @user = User.new

end

def create
   @user = User.new(user_params)
   if @user.valid?
    @user.save
    redirect_to items_path
   else
    redirect_to new_user_path
   end
end

def destroy
 @user = User.find(params[:id])
  @user.destroy
  redirect_to items_path
end




private
def user_params
    params.require(:user).permit(:name, :email, :password, :address, :vendor)

end


end





# <form action="/users/id" method="post" target="_blank">
#   First name: <input type="text" name="fname"><br>
#   Last name: <input type="text" name="lname"><br>
#   <input type="submit" value="Submit">
# </form>













# <%= form_tag("/items", method: "get") do %>
#     <%= label_tag(:q, "Search for:") %>
#     <%= text_field_tag(:q) %>
#     <%= submit_tag("Search") %>
#     <% end %>
