class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.boolean :rsvp
      t.string :location
      t.boolean :paid_event
      t.string :price
      t.integer :members
      t.references :language, foreign_key: true

      t.timestamps
    end
  end
end
