# frozen_string_literal: true

# CreateDiagnoses Migration
class CreateDiagnoses < ActiveRecord::Migration[6.0]
  def change
    create_table :diagnoses do |t|
      t.references :regular_inspection
      t.integer :component_category
      t.integer :result
      t.references :injury
      t.string :observation
      t.jsonb :other_data
      t.timestamps
    end
  end
end
