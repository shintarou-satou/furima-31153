class OrdersController < ApplicationController

  def index
    @product = Product.find(params[:product_id])
    @order_address = OrderAddress.new
  end


  def new
    @order_address = OrderAddress.new
  end

  def create
    @product = Product.find(params[:product_id])
    @order_address = OrderAddress.new(order_params)
     if @order_address.valid?
        @order_address.save
        redirect_to  root_path
     else
        render action: :index
     end
  end
  
  private
    def order_params
      params.require(:order_address).permit(:postal_code, :todoufuken_address_id, :shityouson_address, :banchi_address, :building, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id])
    end

end