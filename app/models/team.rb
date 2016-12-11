class Team < ApplicationRecord
  belongs_to :event
  has_many :attendees
end