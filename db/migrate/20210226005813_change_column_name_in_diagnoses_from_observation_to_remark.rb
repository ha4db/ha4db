# frozen_string_literal: true

# ChangeColumnNameInDiagnosesFromObservationToRemark Migrate
class ChangeColumnNameInDiagnosesFromObservationToRemark < ActiveRecord::Migration[6.0]
  def change
    rename_column :diagnoses, :observation, :remark
  end
end
