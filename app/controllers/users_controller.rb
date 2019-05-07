class UsersController < ApplicationController


   def index
    @items = Item.all
   end
    

    def show
        @user = User.find(params[:id])
        @items = Item.all 
    end



    
end


















# <%= form_tag("/items", method: "get") do %>
#     <%= label_tag(:q, "Search for:") %>
#     <%= text_field_tag(:q) %>
#     <%= submit_tag("Search") %>
#     <% end %>