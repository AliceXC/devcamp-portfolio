Rails.application.routes.draw do
  
  devise_for :users, path: '',path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :portfolios, except: [:show]
  get 'angular-items', to: 'portfolios#angular'
  get 'ruby-on-rails-items', to: 'portfolios#ruby_on_rails'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  # we can customize the get 'any_str'
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs do
    member do
      get :toggle_status # not post but get 
    end
  end
  # every time make new change to routes file, we have to restart the server
  # setting is root path, im setting the home page
  root to: 'pages#home' 

end
