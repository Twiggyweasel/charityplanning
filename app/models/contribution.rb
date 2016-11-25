class Contribution < ApplicationRecord
   belongs_to :event 
   
   validates :amount, presence: true
end