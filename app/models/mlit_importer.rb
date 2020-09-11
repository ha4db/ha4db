# frozen_string_literal: true

# Mlit Importer class
class MlitImporter
  # for human_attribute_name
  include ActiveModel::Model
  attr_accessor :upload_file

  class << self
    def import(file)
      import_from_excel_file(file)
    end

    private

    def import_from_excel_file(file)
      xlsx = Roo::Spreadsheet.open(file)
      bridge = Bridge.new
      # read first sheet
      sheet = xlsx.sheet(0)
      name = sheet.cell(6, 1)
      bridge.name = name
      address = sheet.cell(6, 6)
      bridge.address = address
      latitude_string = sheet.cell(4, 11)
      longitude_string = sheet.cell(5, 11)
      latitude = LocationImplement.sexagesimal_to_float(latitude_string)
      longitude = LocationImplement.sexagesimal_to_float(longitude_string)
      bridge.location = "POINT(#{longitude} #{latitude})"
      bridge
    end
  end
end
