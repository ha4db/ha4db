# frozen_string_literal: true

# CreateRegularInspection migration
class CreateRegularInspections < ActiveRecord::Migration[6.0]
  def change
    create_table :regular_inspections do |t|
      t.references :bridge
      t.string :title
      t.jsonb :other_data
      t.timestamps
    end
  end
end
