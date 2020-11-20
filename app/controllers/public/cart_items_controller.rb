class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_update)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to cart_items_path
  end

  def add_item
    @cart_item = CartItem.new(cart_params)
    @cart_item.end_user_id = current_end_user.id
    if current_end_user.cart_items.exists?(product_id: @cart_item.product_id)
      update_cart_item = current_end_user.cart_items.find_by(product_id: @cart_item.product_id)
      update_cart_item.quantity += @cart_item.quantity
      update_cart_item.update(quantity: update_cart_item.quantity)
    else
      @cart_item.save
    end
    redirect_to cart_items_path
  end

 private
  def cart_params
    params.require(:cart_item).permit(:quantity, :product_id)
  end

  def cart_update
    params.require(:cart_item).permit(:quantity)
  end
end
