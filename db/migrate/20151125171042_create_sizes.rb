class CreateSizes < ActiveRecord::Migration[5.0]
  def change
    create_table :sizes do |t|
      t.text :label
    end
  end
end
