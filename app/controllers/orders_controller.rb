class OrdersController < ApplicationController
	def new
		@order = Order.new		
		
	end

	def create
		@order = Order.new(order_params)		
	    @order.user_id = current_user.id

		if @order.save

		redirect_to @order

		else
			render 'new'
		end
	end

	def show
		@product = Product.find(params[:id])
		@order = Order.find(params[:id])
		
	end


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
	      :address_building
	    )
	  end
end
