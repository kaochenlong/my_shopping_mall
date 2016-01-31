class OrdersController < ApplicationController
  before_action :initialize_cart

  def create
    # 刷卡
    # insert order
    # insert order_items

    # 清空 cart
    session[:my_cart] = nil

    flash[:notice] = "感謝大爺!"
    redirect_to products_path
  end
end
