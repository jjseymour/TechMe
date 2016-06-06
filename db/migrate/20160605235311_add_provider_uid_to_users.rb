class AddProviderUidToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :provider_uid, :string
    add_index :users, :provider_uid
  end
end
