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

# ＿＿＿headerの検索分
		if params[:search].present?
		@products = @products.header_search params[:search]
		end
# ＿＿＿＿＿＿
		# パラメータとして受け取っている場合は絞って検索する
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
		@product = Product.find(params[:id])
	end

	def edit
		@product = Product.find(params[:id])
		@regions = Region.all
	end

	def update
		@product = Product.find(params[:id])
		@product.update(product_params)
		redirect_to root_path

		@product.productable_id =  Product.find_by_id (params[:id])
		# @product.productable_id = Product.find(params [:productable_id])
	end

	def products_deleter
		redirect_to(products_path) unless current_user.admin_flg? || current_user
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
	    )
	  end

end
