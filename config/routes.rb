Rails.application.routes.draw do
  root 'pages#index'
  get '/login', to: 'users#login'
  post '/result', to: 'users#result'

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
