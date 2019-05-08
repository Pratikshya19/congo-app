class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticated, :cart
  # helper_method :current_cart

  def current_user
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  def logged_in?
    !!current_user
  end

  def authenticated
  redirect_to login_path unless logged_in?
  end



  def cart
    session[:cart] ||= []
  end

#   def current_cart
#     @cart = Cart.find()
#     if session[:item_id]
#       Item.find(Session[:item_id])
# end
# Item.new
# end

end
