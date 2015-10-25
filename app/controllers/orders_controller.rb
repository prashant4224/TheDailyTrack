class OrdersController < InheritedResources::Base

  private

    def order_params
      params.require(:order).permit(:user_id, :checked_out_at, :total_price)
    end
end

