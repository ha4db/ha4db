# frozen_string_literal: true

# DropBridgeContentInspections Migrate
class DropInspections < ActiveRecord::Migration[6.0]
  def change
    drop_table :inspections do |t|
      t.references :bridge
      t.geometry :geom, srid: 4326, geographic: true
      t.index :geom, using: :gist
      # separate 2d/3d data
      t.geometry :geom3d, has_z: true
      t.index :geom3d, using: :gist
      t.string :title
      t.integer :category, default: 0
      t.jsonb :report_data
      t.datetime :date
      t.timestamps
    end
  end
end
