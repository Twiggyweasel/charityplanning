class Organization < ApplicationRecord
  has_many :events
  has_many :attendees, through: :events
  has_many :contributions, through: :events
  
  mount_uploader :org_cover, OrgCoverUploader
end