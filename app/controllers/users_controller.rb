class UsersController < ApplicationController

  def show
    @items = Item.all
    if logged_in?
      @user = User.find(session[:user_id])
    else
      redirect_to login_path
    end
  end



end


















# <%= form_tag("/items", method: "get") do %>
#     <%= label_tag(:q, "Search for:") %>
#     <%= text_field_tag(:q) %>
#     <%= submit_tag("Search") %>
#     <% end %>
