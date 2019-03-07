Rails.application.routes.draw do
  
  resources :portfolios, except [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  # we can customize the get 'any_str'
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs
  # every time make new change to routes file, we have to restart the server
  # setting is root path, im setting the home page
  root to: 'pages#home' 

end
