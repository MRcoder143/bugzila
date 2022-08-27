Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

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
