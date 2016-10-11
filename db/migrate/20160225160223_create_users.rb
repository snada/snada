class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nickname

      t.integer :role, default: 0, null: false

      #GitHub
      t.string :github_uid
      t.string :github_avatar
      t.string :github_url

      # Authlogic
      # t.string :crypted_password
      # t.string :password_salt
      t.string :persistence_token
      t.string :single_access_token
      t.string :perishable_token
      t.integer :login_count, default: 0, null: false
      t.integer :failed_login_count, default: 0, null: false
      t.datetime :last_request_at
      t.datetime :current_login_at
      t.datetime :last_login_at
      t.string :current_login_ip
      t.string :last_login_ip

      t.timestamps null: false

      t.timestamps null: false
    end
  end
end
