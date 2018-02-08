class UsersController < ApplicationController
	# def new

	# redirect_to products_path 
	# end

	def show
 	 	@user = User.find(params[:id])
	end

	def user_params
    params.require(:user).permit(
    	:nick_name,
    	:first_name,
    	:last_name,
    	:first_name_kana,
    	:last_name_kana,
    	:postal_code    	
      )

	end


end
