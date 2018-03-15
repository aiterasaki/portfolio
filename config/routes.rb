Rails.application.routes.draw do
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

	# resources :statuses

	resources :users, :only => [ :show]


	# devise_scope :user do
	# get "sign_in", :to => "users/sessions#new"
	# get "sign_out", :to => "users/sessions#destroy" 
	# end

end
