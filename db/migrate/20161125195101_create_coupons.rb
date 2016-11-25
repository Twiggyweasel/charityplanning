class CreateCoupons < ActiveRecord::Migration[5.0]
  def change
    create_table :coupons do |t|
      t.string :promo_code
      t.string :description
      t.float :discount
      t.date :start_date
      t.date :expiration
      t.references :event, foreign_key: true
      
      t.timestamps
    end
  end
end
