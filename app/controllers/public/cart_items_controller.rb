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
    binding.pry
    if current_end_user.cart_items.find_by(product_id: params[:cart_item][:product_id])
      cart_item = current_end_user.cart_items.find_by(product_id: params[:cart_item][:product_id])
      cart_item.quantity = cart_item.quantity + params[:cart_item][:quantity].to_i
    else
      cart_item = CartItem.new(cart_add_params)
      cart_item.end_user_id = current_end_user.id
    end
      cart_item.save
      redirect_to cart_items_path
  end

  private
  def cart_add_params
      params.require(:cart_item).permit(:product_id, :end_user_id, :quantity)
  end

  def cart_item_update
      params.require(:cart_item).permit(:quantity)
  end

end
