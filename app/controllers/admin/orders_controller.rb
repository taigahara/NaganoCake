class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    order = Order.find(params[:id])
    order.update(status_params)
    if order.status == 'confirmation_pay'
      order.order_details.each do |detail|
          detail.production_status = 1
          detail.save
      end
  end
    redirect_to admin_order_path(order)
  end

private
  def status_params
    params.require(:order).permit(:status, :production_status)
  end
end
