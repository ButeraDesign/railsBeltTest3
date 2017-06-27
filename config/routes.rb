Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#new'
  #get '/main' => 'users#new'
  #get '/dashboard/:id' => 'users#show'

  resources :users
  resources :sessions
end
