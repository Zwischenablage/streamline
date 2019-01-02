Rails.application.routes.draw do
  resources :oems
  resources :session_types
  resources :users
  resources :sessions

  resources :customers do
    resources :projects
  end

  get 'streamline/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
