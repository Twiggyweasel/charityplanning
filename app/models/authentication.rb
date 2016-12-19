class Authentication < ApplicationRecord
  belongs_to :user
  
  
  def self.find_with_omniauth(auth)
    find_by_provider_and_uid(auth['provider'], auth['uid'])
  end

  def self.create_with_omniauth(auth)
    # create! do |user|
    #   user.uid = auth['uid']
    #   user.provider = auth['provider'] # and other data you might want from the auth hash
      
    # end
    create(uid: auth['uid'], provider: auth['provider'])
  end
end