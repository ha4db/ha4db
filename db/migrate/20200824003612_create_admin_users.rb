# frozen_string_literal: true

# Create admin_users table
class CreateAdminUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_users do |t|
      t.string :login_name
      t.string :password_digest

      t.timestamps
    end
  end
end
