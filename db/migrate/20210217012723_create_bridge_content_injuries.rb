# frozen_string_literal: true

# CreateBridgeContentInjuries Migrate
class CreateBridgeContentInjuries < ActiveRecord::Migration[6.0]
  def change
    create_table :bridge_content_injuries do |t|
      t.references :bridge_content
      t.references :injury
      t.jsonb :other_data
      t.timestamps
    end
  end
end
