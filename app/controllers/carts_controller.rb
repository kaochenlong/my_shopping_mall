class CartsController < ApplicationController

  def add
    flash[:notice] = "感謝您! 已加到購物車!"
    redirect_to products_path
  end

end
