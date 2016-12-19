Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "NH5IHq6q7dJuMgj56NmA58fyP", "fdABin3SMuyZPOEUpbyQpMqSsysNQQ1rY5IU2sJKlucORD4L9o"
  provider :google_oauth2, "340556426856-uok16fr3m69nlpmquh5goq4ovmk34mbc.apps.googleusercontent.com", "csfDDr8p05aW5QGLfNNhsO3Z"
  provider :facebook, "438500613204488", "641f8df46e8a6e2a36e9d906a8451f22"
  provider :identity, fields: [:email, :name], model: User, on_failed_registration: lambda { |env|      
    UsersController.action(:new).call(env)  
  }
  # ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
  # "API_KEY", "API_SECRET"
end