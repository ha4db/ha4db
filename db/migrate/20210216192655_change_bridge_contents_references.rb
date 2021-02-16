# frozen_string_literal: true

# ChangeBridgeContentsReferences Migration
class ChangeBridgeContentsReferences < ActiveRecord::Migration[6.0]
  def change
    add_reference :bridge_contents, :regular_inspection, index: true
    add_reference :bridge_contents, :component, index: true
    remove_reference :bridge_contents, :bridge
  end
end
