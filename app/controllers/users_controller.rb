class UsersController < ApplicationController
before_action :authenticate_user!, only: [:edit, :update]
before_action :admin, only: [:index,:destroy]

    def index
        @users = User.all
        
    end

	def show
        @user = User.find(params[:id])
	end

    def purchase_history # 購入履歴
        @user = User.find(params[:id])
        @product = Product.find(params[:id])
    end

    def exhibition_history # 出品履歴
        @user = User.find(params[:id]) 
    end

    def admin
      redirect_to(users_path) unless current_user.admin_flg?
    end


    def destroy
        @user = User.find(params[:id])
        @user.destroy
        flash[:success] = "User deleted." 
        redirect_to users_path
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
