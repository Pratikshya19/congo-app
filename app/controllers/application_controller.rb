class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticated
  helper_method :current_cart


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

  def current_cart
    session[:cart] ||= []
  end

  def counted_items
    counted_items = current_cart.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
  end


end
