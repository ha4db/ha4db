# frozen_string_literal: true

# CreateBridgeMainContents Migrate
class CreateBridgeMainContents < ActiveRecord::Migration[6.0]
  def change
    create_table :bridge_main_contents do |t|
      t.references :bridge_content
      t.timestamps
    end
  end
end
