class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end

  def update
    
  end

  def destroy
    
  end

  def all_destroy
    
  end

  def add_item
    @cart_item = CartItem.new(cart_product_params)
    @cart_item.save
    redirect_to cart_items_path
  end

  private
  def cart_product_params
    params.require(:cart_item).permit(:quantity, :product_id, :end_user_id)
  end

end
