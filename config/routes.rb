Rails.application.routes.draw do
	root to: "home#index"
	resources :users, only: [:index, :show]
	devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations' }
end
