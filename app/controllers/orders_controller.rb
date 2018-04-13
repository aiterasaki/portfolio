class OrdersController < ApplicationController
	def new
		@order = Order.new
		@product = Product.find(params[:product_id])
	end

	def create
		@order = Order.new(order_params)
		@order.user_id = current_user.id
		@order.product_id = params[:product_id]
		if @order.save
			@product = Product.find(params[:product_id])
			@product.update(sell_flg: false) 
			redirect_to root_path, notice: '送信が完了しました！'
		else
			render 'new'
		end
	end

	private
	  def order_params
	    params.require(:order).permit(
	      :user_id,
	      :product_id,
	      :method_of_payment,
	      :first_name,
	      :last_name,
	      :postal_code,
	      :region_id,
	 	  :address_city,
	      :address_street,
	      :address_building,
	      product_orders_attributes: [:id,:order_id, :product_id]
	    )
	  end
end






