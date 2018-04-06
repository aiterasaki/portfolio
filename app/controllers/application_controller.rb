class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :authenticate_user!
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
	devise_parameter_sanitizer.permit(:sign_up, keys: [:nick_name, :first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :region_id, :address_city, :address_street, :address_building, :telephone ])
	devise_parameter_sanitizer.permit(:sign_in, keys: [:nick_name, :first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :region_id, :address_city, :address_street, :address_building, :telephone ])
	devise_parameter_sanitizer.permit(:account_update, keys: [:nick_name, :first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :region_id, :address_city, :address_street, :address_building, :telephone ])
	end

	def after_sign_in_path_for(resource)
		if current_user.admin_flg == true
			admin_products_path # ログイン後に遷移するpathを設定
		else
			root_path 
		end 
	end

	def after_sign_out_path_for(resource)
		root_path # ログアウト後に遷移するpathを設定
	end

end
