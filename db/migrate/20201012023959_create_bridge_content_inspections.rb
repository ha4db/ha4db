# frozen_string_literal: true

# CreateBridgeContentInspections migration
class CreateBridgeContentInspections < ActiveRecord::Migration[6.0]
  def change
    create_table :bridge_content_inspections do |t|
      t.references :bridge_content
      t.references :inspection
      t.jsonb :data
      t.timestamps
    end
  end
end
