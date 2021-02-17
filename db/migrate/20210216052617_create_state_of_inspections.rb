# frozen_string_literal: true

# CreateStateOfInspections Migrate
class CreateStateOfInspections < ActiveRecord::Migration[6.0]
  def change
    create_table :state_of_inspections do |t|
      t.references :regular_inspection
      t.integer :component_category
      t.references :bridge_content
      t.jsonb :other_data
      t.timestamps
    end
  end
end
