Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "admin/categories#index"
	
	namespace :admin do
  	resources :categories, only: [:index, :create, :update, :destroy]
  	resources :users, only: [:index] do
      member do
  		  post :role_change
      end
  	end
	end

end
