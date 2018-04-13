Rails.application.routes.draw do

	resources :products do
		resources :orders,except: [:show]
	end

	devise_for :users, :controllers => {
		:registrations => 'users/registrations',
		:sessions => 'users/sessions'
	} 

	root 'products#index'

	resources :users, :only => [ :show, :index] do
		get 'purchase_history', on: :member
		get 'exhibition_history', on: :member
	end

	delete '/users/:id', to: 'users#destroy'

end
