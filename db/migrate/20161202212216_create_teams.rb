class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :max_size
      t.references :event, foreign_key: true
    end
  end
end
