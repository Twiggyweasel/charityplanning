class Contribution < ApplicationRecord
  belongs_to :event 
  belongs_to :user
  validates :amount, presence: true
  
  
  after_save do 
    if !self.honoree.blank?
      self.update_column(:in_honor, true)
    end
  end

end