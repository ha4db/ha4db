# frozen_string_literal: true

# CreateSoundnesses migration
class CreateSoundnesses < ActiveRecord::Migration[6.0]
  def change
    create_table :soundnesses do |t|
      t.references :bridge
      t.datetime :evaluation_at
      t.string :evaluation
      t.integer :overall_evaluation, default: 0
      t.timestamps
    end
  end
end
