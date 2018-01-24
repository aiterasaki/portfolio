class ProductsController < ApplicationController


	def new
		@product = Product.new
		@regions = Region.all
		@product.product_images.build

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
		# @product.product_images = ProductImage.all
		
	end

	def show
		@product = Product.find(params[:id])
		
		
	end

	def edit
		@product = Product.find(params[:id])
		@regions = Region.all
		
	end

	def update
		@product = Product.find(params[:id])
		@product.update(product_params_up)

		redirect_to product_path(@product.id)
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy

		redirect_to products_path
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
	      :sell_flg,
	      :name,
	      :thumbnail,
	      product_images_images: []
	    
	    )
	  end

	  def product_params_up
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
	      :sell_flg,
	      :name,
	      :thumbnail,
	      product_images_images: []
	    
	    )
	  end
	
end
