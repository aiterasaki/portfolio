Rails.application.routes.draw do
<<<<<<< HEAD

	namespace :admins do
		resources :products 
	end
=======
	# devise_for :admins

	# namespace :admin do
	# 	resources :products
	# end
>>>>>>> 207e3ec3270d803271790b4f2da66de0a9850243

	resources :products do
		resources :orders,except: [:show]
	end


	devise_for :admins, controllers: {
		sessions:      'admins/sessions',
		passwords:     'admins/passwords',
		registrations: 'admins/registrations'
		}

	devise_for :users, :controllers => {
		:registrations => 'users/registrations',
		:sessions => 'users/sessions'   
	} 

	root 'products#index'

	resources :users, :only => [ :show] do
		get 'purchase_history', on: :member
		get 'exhibition_history', on: :member
	end

end
