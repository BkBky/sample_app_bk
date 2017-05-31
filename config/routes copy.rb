

Rails.application.routes.draw do
  root 'static_pages#home'
  # get 'static_pages/home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  # this was the first route, when I start this application
  # root 'application#hello'
  
end

Rails.application.routes.draw do
  root 'static_pages#home'
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'
  get 'static_pages/contact'
  # this was the first route, when I start this application
  # root 'application#hello'
  
end

