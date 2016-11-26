class Event < ApplicationRecord
  has_many :comments 
  has_many :contributions
  has_many :attendees
  has_many :guests, through: :attendees
  has_many :event_sizes
  has_many :sizes, through: :event_sizes
  has_many :coupons
  has_many :registration_fees
  
  
  validates :name, presence: true
  
  
  after_find do
    if Contribution.where(event_id: self.id).where('created_at >= ?', 1.hour.ago).count != 0
      self.update_column(:raised, Contribution.where(event_id: self.id).pluck(:amount).sum)  
    end
    #self.raised = Contribution.where(event_id: self.id).pluck(:amount).sum
  end
  
  after_save do 
    if self.sizes.count == 0 
      self.update_column(:has_shirt, false)
    end
  end
  
  def total_attending
    self.attendees.count + self.guests.count
  end
  
  def percent_remaining
    if !self.raised.nil?
        0
    else
        (self.raised/self.goal) * 100  
    end
  end
end