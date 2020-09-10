# frozen_string_literal: true

# Mlit Importer class
class MlitImporter
  include ActiveModel::Model

  attr_accessor :excel_file

  def import; end

  def batch_import; end
end
