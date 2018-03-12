class OrdersController < ApplicationController
	def new
		@order = Order.new
		@product = Product.find(params[:product_id])
	end

	def create
		@order = Order.new(order_params)
		@order.user_id = current_user.id

		if @order.save
			@product = Product.find(params[:product_id])
			@product.sell_flg = false
			#@product.update(sell_flg: false) if @product.sell_flg == true
			# ここで、プロダクトオーダー（注文履歴的なの）に商品の情報と、オーダーの情報セーブ

			# @product_order = ProductOrder.new
			# @product_order.product_id = @product.id
			# @product_order.order_id = @order.id
			redirect_to root_path, notice: '送信が完了しました！'
			# @product_order.save
			@order.save
		else
			render 'new'
		end
	end

	# def show
		# @order = Order.find(params[:id])
		# @order = Order.new(order_params)
	    # @order.user_id = current_user.id
	    # if @order.save
		   # redirect_to @order, notice: '応募が完了しました！'
		   # # @order.product.sell_flg = false
		   # # @order.product.save
	    # else
	    #   render :new
	    # end	
	# end

	private

	  def order_params
	    params.require(:order).permit(
	      :user_id,
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






