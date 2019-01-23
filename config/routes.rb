Rails.application.routes.draw do
  resources :users
  resources :param_sets do
    collection do
      get :search
    end
  end
  resources :customers do
    resources :projects do
      resources :sessions
    end
  end

  #get 'streamline/index'
  root 'customers#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
