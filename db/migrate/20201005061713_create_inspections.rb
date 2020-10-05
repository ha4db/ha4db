# frozen_string_literal: true

# CreateInspections migration
class CreateInspections < ActiveRecord::Migration[6.0]
  def change
    create_table :inspections do |t|
      t.references :bridge
      t.geometry :geom, srid: 4326, geographic: true, has_z: true
      t.index :geom, using: :gist
      t.string :title
      t.integer :category
      t.jsonb :report_data
      t.datetime :date
      t.timestamps
    end
  end
end
