class UsersController < ApplicationController

	def show
 	 	# @user = User.find(params[:id])
        @user = current_user
        @order = Order.find(params[:id])

	end

	def user_params
    params.require(:user).permit(
        :email,
    	:nick_name,
    	:first_name,
    	:last_name,
    	:first_name_kana,
    	:last_name_kana,
    	:postal_code,
        :region_id,
        :address_city,
        :address_street,
        :address_building, 
        :telephone   	
      )
	end
end
