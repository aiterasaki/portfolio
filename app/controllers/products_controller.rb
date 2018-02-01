class ProductsController < ApplicationController


	def new
		@product = Product.new
		@product.product_images.build
		@productable = @product.productable

	end

	def create
		@product = Product.new(product_params)
	    @product.user_id = current_user.id
	    # binding.pry
	  	 if @product.save

	  	 	# if params.require(:product)[:productable_type] == "LadiesCategory"
		  	 # 	ladies_category = LadiesCategory.find(params.require(:product)[:productable_id])
		  	 # 	ladies_category.update(category_id: params.require(:productable_attributes)[:category_id])
	  	 	# end

	  	 	#  if params.require(:product)[:productable_type] == "MensCategory"
		  	 # 	mens_category = MensCategory.find(params.require(:product)[:productable_id])
		  	 # 	mens_category.update(category_id: params.require(:productable_attributes)[:category_id])
		  	 # end
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
		@product.update(product_params)

		redirect_to product_path(@product.id)
	# binding.pry	
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
	      :productable_id,
	      :productable_type,
	      :thumbnail,
	      product_images_images: []
	      # productable_attributes: [:category_id]
	    )
	  end

	  # def product_params_up
  	#     params.require(:product).permit(
	  #     :user_id,
	  #     :brand,
	  #     :detail,
	  #     :status,
	  #     :burden_of_shipping_fee,
	  #     :shipping_method,
	  #     :region_id,
	  #     :estimated_shipping_date,
	  #     :price,
	  #     :sell_flg,
	  #     :name,
	  #     :thumbnail,
	  #     product_images_images: []
	    
	  #   )
	  # end
	
end
