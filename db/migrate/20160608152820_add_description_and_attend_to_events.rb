class AddDescriptionAndAttendToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :description, :string
    add_column :events, :attend, :string
  end
end
