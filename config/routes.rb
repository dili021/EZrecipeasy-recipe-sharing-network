Rails.application.routes.draw do
  root                     'recipes#index'
  post   '/',          to: 'recipes#create'  
  # get    '/recipes/search', to: 'recipes#search'
  get    '/sign_up',   to: 'users#new'
  
  get    '/login',     to: 'sessions#new'
  post   '/login',     to: 'sessions#create'
  delete '/logout',    to: 'sessions#destroy'

  post   '/follows',   to: 'follows#follow_user'
  delete '/follows',   to: 'follows#unfollow_user'

  resources :users
  resources :recipes do
    resource :like, module: :recipes
    member do
      put 'upvote', to: 'recipes#upvote'
      put 'downvote', to: 'recipes#downvote'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
