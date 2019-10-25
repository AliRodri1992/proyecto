# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  create_table :users do |t|
    ## Database authenticatable
    t.string :username, :null => false
    t.references  :rol, :null => false, :foreign_key => true
    t.string :email, :default => ""
    t.string :encrypted_password, :null => false, :default => ""

    ## Recoverable
    t.string :reset_password_token
    t.datetime :reset_password_sent_at

    ## Rememberable
    t.datetime :remember_created_at

    ## Trackable
    t.integer :sign_in_count, :default => 0, :null => false
    t.datetime :current_sign_in_at
    t.datetime :last_sign_in_at
    t.inet :current_sign_in_ip
    t.inet :last_sign_in_ip

    t.timestamps :null => false
  end

  add_index :users, :username, :unique => true
  add_index :users, :email, :unique => true
  add_index :users, :reset_password_token, :unique => true

  User.create(username: 'ADMINISTRADOR', password: 'administrador', email: 'administrador@ukko.mx', rol_id: 1)
end
