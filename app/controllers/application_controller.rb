class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_cart
  helper_method :current_user, :current_admin?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def set_cart
    @cart = Cart.new(session[:cart])
  end

  def format_price(number)
    "$#{sprintf('%.2f', number.to_f/100)}"
  end

end
