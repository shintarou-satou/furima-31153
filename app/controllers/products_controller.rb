class ProductsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]
  before_action :move_to_index, except:[:index, :show, :new, :create]

  def index
    @products = Product.order("created_at DESC")
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

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

     if @product.update(product_params)
      redirect_to product_path
     else
      render :edit
     end 
  end
end

 private

  def  product_params
    params.require(:product).permit(
      :image, :product, :explanation, :category_id, :condition_id, :delivery_fee_id, :todoufuken_address_id, :shipping_time_id, :price).
      merge(user_id: current_user.id)
  end

  def move_to_index
    @product = Product.find(params[:id])
      unless user_signed_in?
        redirect_to  user_session_path
      end

      unless current_user.id  == @product.user.id
        redirect_to  root_path
      end
  end

