class ProductsController < ApplicationController
  before_action :authenticate_user!, except:[:index]

  def index
    # @products = Product.order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    
    @product = Product.new(product_params)
    if @product.valid?
       @product.save
       redirect_to action: :index
    else  
       render action: :new
    end  
  end



end

private

  def  product_params
    params.require(:product).permit(
      :imege, :product, :explanation, :category_id, :condition_id, :delivery_fee_id, :todoufuken_address_id, :shipping_time_id, :price).
      merge(user_id: current_user.id)

  end