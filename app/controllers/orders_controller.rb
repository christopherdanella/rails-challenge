class OrdersController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found 
  
  def create
    @order = Order.new(permitted_params)
     
    if @order.save
      render json: @order
    else
      render json: {
        error: @order.errors.messages,
        status: 400
      }, status: 400
    end
  end

  def show
    @order = Order.find(params[:id]).to_json
    render json: @order
  end

  private

  def permitted_params
    params.require(:order).permit(
      :customer_id,
      :total_cost,
      :status,
      variant_ids: [],
    )
  end
  
  def record_not_found(error)
    render json: {
      error: error.message,
      status: 404
    }, status: 404 
  end
end
