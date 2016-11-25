class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name, :venue_name, :street, :city, :state, :zip
      t.text :desc
      t.text :teaser
      t.float :goal, :raised
      t.date :date, :registration_start
      t.time :start_time
      t.boolean :has_donation, default: false
      t.boolean :is_private, default: true
      t.boolean :has_shirt, default: true
      t.references :organization, foreign_key: true
      
      t.timestamps
    end
  end
end
