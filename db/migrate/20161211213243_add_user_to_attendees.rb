class AddUserToAttendees < ActiveRecord::Migration[5.0]
  def change
    add_reference :attendees, :user, foreign_key: true
  end
end
