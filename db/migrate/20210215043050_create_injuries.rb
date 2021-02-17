# frozen_string_literal: true

# CreateInjuries Migration
class CreateInjuries < ActiveRecord::Migration[6.0]
  def change
    create_table :injuries do |t|
      t.references :regular_inspection
      t.references :component
      t.string :injury_type
      t.integer :injury_grade
      t.jsonb :other_data
      t.timestamps
    end
  end
end
