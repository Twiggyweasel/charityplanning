class CreateAttendee < ActiveRecord::Migration[5.0]
  def change
    create_table :attendees do |t|
      t.float :fee
      t.string :shirt_size
      t.boolean :paid, default: false
      t.references :event, foreign_key: true
      
      t.timestamps
    end
  end
end
