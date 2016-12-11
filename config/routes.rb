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
  
  resources :users, except: [:new] 
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  get '/logout', to: "sessions#destroy"
    
  get '/register', to: 'users#new'
  
  resources :organizations
end
