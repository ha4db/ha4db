# frozen_string_literal: true

# DropBridgeContentInspections Migrate
class DropBridgeContentInspections < ActiveRecord::Migration[6.0]
  def change
    drop_table :bridge_content_inspections do |t|
      t.references :bridge_content
      t.references :inspection
      t.jsonb :data
      t.timestamps
    end
  end
end
