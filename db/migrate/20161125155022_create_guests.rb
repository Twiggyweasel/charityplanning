class CreateGuests < ActiveRecord::Migration[5.0]
  def change
    create_table :guests do |t|
      t.float :fee
      t.string :name, :shirt_size
      t.boolean :paid
      t.references :attendee, foreign_key: true
      
      t.timestamps
    end
  end
end
