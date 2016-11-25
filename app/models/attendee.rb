class Attendee < ApplicationRecord
  belongs_to :event
  has_many :guests, inverse_of: :attendee
  accepts_nested_attributes_for :guests, allow_destroy: true, reject_if: :reject_guest
  
  def reject_guest(attributes)
    attributes['name'].blank?
  end 
end