class User < OmniAuth::Identity::Models::ActiveRecord
  has_one :role
  has_many :attendees
  has_many :guests, through: :attendees
  has_many :events, through: :attendees
  has_many :teams, through: :attendees
  has_many :contributions
  
  
 # has_secure_password
  has_many :authentications
  
  # email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # validates :email, :presence   => true,
  #           :format     => { :with => email_regex },
  #           :uniqueness => { :case_sensitive => false }
  
  def self.create_with_omniauth(auth)
    # you should handle here different providers data
    # eg. case auth['provider'] ..
    case auth['provider']
    when 'facebook'
      create(name: auth['info']['name'], password: rand(36**10).to_s(36), email: auth['info']['email'])
    when 'google_oauth2'
      create(name: auth['info']['name'], password: rand(36**10).to_s(36), email: auth['info']['email'])
    when 'twitter'
      create(name: auth['info']['name'], password: rand(36**10).to_s(36))
    else
      create(name: auth['info']['name'])
    end
    # IMPORTANT: when you're creating a user from a strategy that
    # is not identity, you need to set a password, otherwise it will fail
    # I use: user.password = rand(36**10).to_s(36)
  end
  
end