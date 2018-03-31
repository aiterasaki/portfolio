Rails.application.routes.draw do
	devise_for :admins

	namespace :admin do
		resources :products
	end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	devise_for :users, :controllers => {
	:registrations => 'users/registrations',
	:sessions => 'users/sessions'   
	} 

	root 'products#index'

	resources :products do
		resources :orders,except: [:show]
  	end
  	resources :orders,only: :show

	resources :users, :only => [ :show]


end
