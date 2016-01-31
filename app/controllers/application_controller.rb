class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def initialize_cart
    @cart = Cart.build_from_hash(session[:my_cart])
  end
end
