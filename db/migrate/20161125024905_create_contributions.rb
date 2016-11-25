class CreateContributions < ActiveRecord::Migration[5.0]
  def change
    create_table :contributions do |t|
      t.float :amount
      t.boolean :in_honor
      t.string :honoree
      t.boolean :paid, default: true
      t.references :event, foreign_key: true
      
      t.timestamps
    end
  end
end
