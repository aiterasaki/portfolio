class ProductsController < ApplicationController
	  before_action :authenticate_user!, only: [:new, :edit, :update]
	  before_action :current_user, only: [:edit, :update]


	def new
		@product = Product.new
		@product.product_images.build
		@productable = @product.productable
# binding.pry
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
		if params[:ladies_category_id].presence
			@ladies_category = LadiesCategory.find(params[:ladies_category_id])
			@products = @ladies_category.products
			
		elsif params[:mens_category_id].presence
			@mens_category = MensCategory.find(params[:mens_category_id])
			@products = @mens_category.products
			
		elsif params[:handmade_category_id].presence
			@handmade_category = HandmadeCategory.find(params[:handmade_category_id])
			@products = @handmade_category.products
		else
			@products = Product.all.order(created_at: 'desc')
		end

		@ladies_categories = LadiesCategory.all
		@mens_categories = MensCategory.all
		@handmade_categories = HandmadeCategory.all
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
		@product.productable_id =  Product.find_by_id (params[:id])
		# @product.productable_id = Product.find(params [:productable_id])
		
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
end
