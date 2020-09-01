# frozen_string_literal: true

# Create users table
class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :login_name
      t.string :password_digest

      t.timestamps
    end
  end
end
