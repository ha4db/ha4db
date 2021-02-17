# frozen_string_literal: true

# CreateComponents Migration
class CreateComponents < ActiveRecord::Migration[6.0]
  def change
    create_table :components do |t|
      t.references :bridge
      t.string :title
      t.integer :component_category
      t.timestamps
    end
  end
end
