Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/gossip/:id', to: 'gossips#show', as: 'gossip'
  get '/team', to: 'pages#team'
  get '/contact', to: 'pages#contact'
  get '/home', to: 'pages#home'
  get '/welcome/:first_name', to: 'pages#welcome'
  root 'gossips#index'

  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'

# log in page with form:
get '/login'     => 'sessions#new'
# create (post) action for when log in form is submitted:
post '/login'    => 'sessions#create'
# delete action to log out:
delete '/logout' => 'sessions#destroy'  

  resources :gossips
  resources :users
  resources :sessions
end
