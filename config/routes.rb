Rails.application.routes.draw do

	# namespace :admins do
	# 	resources :products 
	# end

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
