class Public::OrdersController < ApplicationController

def new
    @order = Order.new
end

def confirm
    @cart_items = CartItem.all
    @order = Order.new(order_params)
    if params[:order][:address_option] == "0"
        @order.address = current_end_user.address
        @order.postal_code = current_end_user.postal_code
        @order.name = current_end_user.first_name + current_end_user.last_name
    elsif params[:order][:address_option] == "1"
        address = Address.find_by(address: params[:address_select])
            @order.address = params[:address_select]
            @order.postal_code = address.postal_code
            @order.name = address.name
    elsif params[:order][:address_option] == "2"
        @order.address = params[:order][:address]
        @order.postal_code = params[:order][:postal_code]
        @order.name = params[:order][:name]
    end
end

def create
    @order = Order.new(order_params)
    @order.end_user_id = current_end_user.id
    @order.save
    @cart_items = CartItem.all

    @cart_items.each do |cart_item|
        @order_detail = OrderDetail.new
        @order_detail.order_id = @order.id
        @order_detail.price = cart_item.product.price
        @order_detail.product_id = cart_item.product_id
        @order_detail.quantity = cart_item.quantity
        @order_detail.save
    end

    @cart_items.destroy_all
    redirect_to orders_thanks_path
end

def thanks
end

private
    def order_params
        params.require(:order).permit(:payment_method, :status, :quantity, :address, :postal_code, :name)
    end
end
