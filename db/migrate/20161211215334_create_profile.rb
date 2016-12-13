class CreateProfile < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.references :user, foreign_key: true
    end
  end
end
