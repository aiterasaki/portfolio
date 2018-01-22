class ProductsController < ApplicationController


	def new
		@product = Product.new
		@regions = Region.all

		# @statuses = Status.all	

	end

	def create
		@product = Product.new(product_params)
	    # @product.user_id = current_user.id
	  	 if @product.save
	    	redirect_to products_path
	    else
	      render 'new'
	    end
	end


	def index
		@products = Product.all.order(created_at: 'desc')
		# @products = Product.all.order(created_at: 'desc').page(params[:page])
	end

	def show
		@product = Product.find(params[:id])
		
		
	end

private

	  def product_params
	    params.require(:product).permit(
	      :user_id,
	      :brand,
	      :detail,
	      :status,
	      :burden_of_shipping_fee,
	      :shipping_method,
	 	  :region_id,
	      :estimated_shipping_date,
	      :price,
	      :sell_flg
	    )
	  end
	
end
