class OrdersController < ApplicationController
  before_action :initialize_cart

  def create
    # 刷卡
    # insert order
    # insert order_items
    flash[:notice] = "感謝大爺!"
    # 清空 cart
    redirect_to products_path
  end
end
