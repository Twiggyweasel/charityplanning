Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'pages#index'
  
  resources :events do 
    resources :comments, only: [:new, :create]
    resources :contributions
    resources :attendees, only: [:new, :create, :show]
  end
end
