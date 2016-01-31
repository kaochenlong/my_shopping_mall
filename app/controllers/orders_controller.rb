class OrdersController < ApplicationController
  before_action :initialize_cart

  def create
    order = Order.new(order_params)
    @cart.items.each do |item|
      order.order_items.new(product_id: item.product.id, quantity: item.quantity)
    end

    if order.save
      # 刷卡
      # nonce = params[:payment_method_nonce]
      #
      # 清空 cart
      #session[:my_cart] = nil

      flash[:notice] = "感謝大爺!"
      redirect_to products_path
    else
      render action: 'carts/checkout'
    end

  end

  private
  def order_params
    params.require(:order).permit(:name, :tel, :address, :email)
  end
end
