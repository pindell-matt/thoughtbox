Rails.application.routes.draw do
  root to: 'home#show'

  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get  '/users/new', to: 'users#new', as: :new_user
  post '/users',     to: 'users#create'

  get  '/links', to: 'links#index'
  post '/links', to: 'links#create'

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :links, only: [:update, :index]
    end
  end

end
