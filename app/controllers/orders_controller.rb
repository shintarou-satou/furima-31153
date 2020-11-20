class OrdersController < ApplicationController
   before_action :authenticate_user!
   before_action :set_product, only:[:index, :create]

  def index
    if user_signed_in? && current_user.id == @product.user_id || @product.order != nil
      redirect_to  root_path
    end

    @order_address = OrderAddress.new
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
     if @order_address.valid?
        pay_item
        @order_address.save
        redirect_to  root_path
     else
        render action: :index
     end
  end
  
  private
    def order_params
      params.require(:order_address).permit(:postal_code, :todoufuken_address_id, :shityouson_address, :banchi_address, :building, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
       Payjp::Charge.create(
           amount: @product.price,
           card: order_params[:token],
           currency: 'jpy'
       )
    end

    def set_product
      @product = Product.find(params[:product_id])
    end

end