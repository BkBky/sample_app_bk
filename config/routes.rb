Rails.application.routes.draw do
  get 'sessions/new'

  # get 'users/new'
  
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new' #this is a custom named route
  # used until charpter 7
  # post '/signup',  to: 'users#create' #this route is due to REST(CRUD + POST, GET, PATH..)
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
end