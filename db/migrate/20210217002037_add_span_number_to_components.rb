# frozen_string_literal: true

# AddSpanNumberToComponents Migrate
class AddSpanNumberToComponents < ActiveRecord::Migration[6.0]
  def change
    add_column :components, :span_number, :integer
  end
end
