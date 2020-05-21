Rails.application.routes.draw do
  root 'users#index'

  get    '/users',             to: 'users#index'
	get		 '/signup',            to: 'users#new'
  get    '/users/search',      to: 'users#search'
  get    '/users/boss_search', to: 'users#boss_search'
	get		 '/users/:id',         to: 'users#show'
  post   '/users/update',      to: 'users#update'
	post 	 '/users',             to: 'users#create'

	get    '/login',   to: 'sessions#new'
	post   '/login',   to: 'sessions#create'
	delete '/logout',  to: 'sessions#destroy'

	resources :posts, except: :index
  post '/posts/update_post_status', to: 'posts#update_post_status'
	resources :comments, only: [:create, :destory]

end
