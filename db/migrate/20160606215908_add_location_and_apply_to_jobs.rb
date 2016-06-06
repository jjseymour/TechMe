class AddLocationAndApplyToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :location, :string
    add_column :jobs, :apply, :string
  end
end
