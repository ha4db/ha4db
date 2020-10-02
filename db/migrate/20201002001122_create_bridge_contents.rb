# frozen_string_literal: true

# CreateBridgeContents migration
class CreateBridgeContents < ActiveRecord::Migration[6.0]
  def change
    create_table :bridge_contents do |t|
      t.references :bridge
      t.string :title

      t.timestamps
    end
  end
end
