class AddEventCoverToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :event_cover, :string
  end
end
