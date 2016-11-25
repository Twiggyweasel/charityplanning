class Organization < ApplicationRecord
  has_many :events
  has_many :attendees, through: :events
  has_many :contributions, through: :events
end