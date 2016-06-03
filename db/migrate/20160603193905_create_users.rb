class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :avatar_pic
      t.string :g_access_token
      t.string :g_refresh_token

      t.timestamps
    end
  end
end
