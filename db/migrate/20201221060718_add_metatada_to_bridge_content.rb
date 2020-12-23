# frozen_string_literal: true

# AddMetadataToBridgeContent migration
class AddMetatadaToBridgeContent < ActiveRecord::Migration[6.0]
  def change
    add_column :bridge_contents, :metadata, :jsonb
    add_index :bridge_contents, :metadata, using: :gin
  end
end
