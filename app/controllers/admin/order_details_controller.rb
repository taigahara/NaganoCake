class Admin::OrderDetailsController < ApplicationController
  def update
    order = OrderDetail.find(params[:id])
    order.update(details_params)
    if order.production_status == 'production'
        order.order.status = 2
        order.order.save
    end
    #! すべて制作完了になったら発送準備中に更新
    order_check = order.order.order_details
    flg = 0
    order_check.each do |check|
        if check.production_status == 'production_comp'
            flg = flg.to_i + 1
        end
    end
    if order_check.length == flg
        order.order.status = 3
        order.order.save
    end
    redirect_to admin_order_path(order.order_id)
end

private
    def details_params
        params.require(:order_detail).permit(:production_status)
    end
end
