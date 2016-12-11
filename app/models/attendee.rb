class Attendee < ApplicationRecord
  belongs_to :event
  belongs_to :team
  has_many :guests, inverse_of: :attendee
  accepts_nested_attributes_for :guests, allow_destroy: true, reject_if: :reject_guest
  
  accepts_nested_attributes_for :team
  
  
  def reject_guest(attributes)
    attributes['name'].blank?
  end
  
  def guests_fee_total
    Guest.where(attendee_id: self.id).pluck(:fee).sum
  end
  
  def attendee_total
    self.fee + Guest.where(attendee_id: self.id).pluck(:fee).sum
  end
end