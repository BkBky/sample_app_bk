Rails.application.routes.draw do
  # get 'users/new'
  
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new' #this is a custom named route
  get  '/signup',  to: 'users#create' #this route is due to REST(CRUD + POST, GET, PATH..)
  resources :users
end