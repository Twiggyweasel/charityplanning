class Event < ApplicationRecord
  has_many :comments 
  has_many :contributions
  has_many :attendees
  has_many :guests, through: :attendees
  has_many :event_sizes
  has_many :sizes, through: :event_sizes
  
  #validates :name, presence: true
  
  
  after_find do
    self.update_column(:raised, Contribution.where(event_id: self.id).pluck(:amount).sum)  
    #self.raised = Contribution.where(event_id: self.id).pluck(:amount).sum
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