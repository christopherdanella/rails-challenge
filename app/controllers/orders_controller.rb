class OrdersController < ActionController::API


  def create
    @order = Order.new(permitted_params)

    if @order.save
      render json: @order 
    else
      render json: {
        error: "Missing required parameters for Customer, Status, or Cost",
        status: 400
      }, status: 400
    end
  end

  private

  def permitted_params
    params.require(:order).permit(
      :customer_id,
      :total_cost,
      :status
    )
  end

end
