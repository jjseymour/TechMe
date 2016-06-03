class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :company
      t.string :position
      t.string :salary
      t.string :date_posted
      t.text :description
      t.references :language, foreign_key: true

      t.timestamps
    end
  end
end
