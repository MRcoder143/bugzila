Rails.application.routes.draw do
# routes for api v1
namespace :api do
  namespace :v1 do
    resources :projects, only: [:index, :show, :create, :update, :destroy]
    resources :users, only: [:index, :show, :create, :update, :destroy]
        resources :bugs, only: [:index, :show, :create, :update, :destroy]
  end
end

# route for authentication login

# post '/auth/login', to: 'api/v1/authentication#login'

# route for livesearch
get '/livesearch' => 'bugs#live_search_data'


  delete 'deleteProject' => 'projects#destroy'

  resources :bugzilas

    get '/signup' => 'users#new'

      get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    delete '/logout' => 'sessions#destroy'
    get '/logout' => 'sessions#destroy'

  resources :users,:projects,:bugs

  root "bugzilas#index"
end
