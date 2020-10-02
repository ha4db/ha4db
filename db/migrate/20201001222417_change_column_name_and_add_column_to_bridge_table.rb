# frozen_string_literal: true

# ChangeColumnNameAndAddColumnToBridgeTable migration
class ChangeColumnNameAndAddColumnToBridgeTable < ActiveRecord::Migration[6.0]
  def change
    rename_column :bridges, :name, :title
    add_column :bridges, :other_data, :jsonb
    add_index :bridges, :other_data, using: :gin
  end
end
