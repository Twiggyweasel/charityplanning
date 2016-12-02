class Team < ApplicationRecord
  has_one :attendee
  belongs_to :event
  
end