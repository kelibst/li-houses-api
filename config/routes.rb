Rails.application.routes.draw do
  
  get 'homepage/home'

  namespace :api do
    namespace :v1 do
      resources :users
      resources :houses
      post '/signin', to: 'user_token#create'
      post '/signup', to: 'users#create'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
