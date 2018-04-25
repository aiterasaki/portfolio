class ProductsController < ApplicationController
	  before_action :authenticate_user!, only: [:new, :edit, :update]
		before_action :products_deleter, only: [:destroy]

	def new
		@product = Product.new
		@product.product_images.build
		@productable = @product.productable
	end

	def create
		@product = Product.new(product_params)
	    @product.user_id = current_user.id
	  	if @product.save
		    redirect_to products_path
	    else
	      render 'new'
	    end
	end

	def index
		if params[:ladies_category_id].presence
			@ladies_category = LadiesCategory.find(params[:ladies_category_id])
			@products = @ladies_category.products.page(params[:page]).per(15)
			
		elsif params[:mens_category_id].presence
			@mens_category = MensCategory.find(params[:mens_category_id])
			@products = @mens_category.products.page(params[:page]).per(15)
			
		elsif params[:handmade_category_id].presence
			@handmade_category = HandmadeCategory.find(params[:handmade_category_id])
			@products = @handmade_category.products.page(params[:page]).per(15)
		else
			@products = Product.all.order(created_at: 'desc').page(params[:page]).per(15)
		end

		@ladies_categories = LadiesCategory.all
		@mens_categories = MensCategory.all
		@handmade_categories = HandmadeCategory.all

# headerの検索
		if params[:search].present?
		@products = @products.header_search params[:search]
		end
# index画面での検索
		if params[:name].present?
		@products = @products.get_by_name params[:name]
		end
		if params[:brand].present?
		@products = @products.get_by_brand params[:brand]
		end
		if params[:status].present?
		@products = @products.get_by_status params[:status]
		end
		if params[:burden_of_shipping_fee].present?
		@products = @products.get_by_burden_of_shipping_fee params[:burden_of_shipping_fee]
		end
		if params[:sell_flg].present?
		@products = @products.get_by_sell_flg params[:sell_flg]
		end
	end

	def show
		# @user = User.find(params[:id])
		@product = Product.find(params[:id])
	end

	def edit
		@product = Product.find(params[:id])
		@regions = Region.all
		@product.user_id == current_user.id
		if @product.user_id != @current_user.id
			flash[:notice] = "権限がありません"
			redirect_to products_path	
		end
	end

	def update
		@product = Product.find(params[:id])
		@product.update(product_params)
		redirect_to root_path
		@product.productable_id =  Product.find_by_id (params[:id])
	end

	def products_deleter
		redirect_to(products_path) unless current_user.admin_flg? || current_user
	end

	def destroy
		@product = Product.find(params[:id])
		# @product.soft_destroyed
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
	  )
	end
end
