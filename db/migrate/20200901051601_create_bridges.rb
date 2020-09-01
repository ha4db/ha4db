# frozen_string_literal: true

# Create bridges table
class CreateBridges < ActiveRecord::Migration[6.0]
  def change
    create_table :bridges do |t|
      t.string :name
      t.st_point :location, srid: 4326, geographic: true
      t.index :location, using: :gist
      t.string :address
      t.timestamps
    end
  end
end
