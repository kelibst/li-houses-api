Rails.application.routes.draw do
  
  get 'homepage/home'

  namespace :api do
    namespace :v1 do
      resources :users
      resources :houses
      resources :favorites, only: [:destroy, :create]


      post '/create/signup', to: 'users#create' 
      post '/auth/signin', to: 'user_token#create'
      get '/dashboard/:username', to: 'users#find_user', as: 'user_detail'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
