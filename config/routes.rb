Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'pages#index'
  
  resources :events do 
    resources :comments, only: [:new, :create]
    resources :contributions
    resources :attendees, only: [:new, :create, :show] do
      resources :guests
    end
    resources :teams
    resources :registration_fees
    resources :coupons
    resources :build, controller: 'events/build'
    get '/attributes', to: 'events#event_attributes'
  end
  
  match '/auth/:provider/callback', to: 'session#create', via: [:get, :post] #omniauth route
  match '/register', to: 'users#new', via: [:get, :post]
  
  match '/login', to: 'session#new', via: [:get, :post]
  match '/logout', to: 'session#destroy', via: [:get, :post]
  resources :users #needed by omniauth-identity
  
  resources :organizations
  

end
