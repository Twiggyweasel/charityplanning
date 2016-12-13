class User < ApplicationRecord
  has_one :role
  has_one :profile, inverse_of: :user
  has_many :attendees
  has_many :guests, through: :attendees
  has_many :events, through: :attendees
  has_many :teams, through: :attendees
  has_many :contributions
  
  
  has_secure_password
  
  accepts_nested_attributes_for :profile
  

  after_save do 
    if self.profile_id.nil?
      self.update_column(:profile_id, Profile.find_by(:user_id => self.id).id )
    end
  end
  
  def full_name
    self.profile.first_name + ' ' + self.profile.last_name
  end
  
end