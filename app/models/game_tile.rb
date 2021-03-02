# frozen_string_literal: true

require 'fileutils'
require 'tmpdir'
require 'tempfile'

# GameTile class
class GameTile
  attr_accessor :file, :tile_dir, :base_zoom, :width, :height

  TILE_SIZE = 256

  def initialize(file, tile_dir)
    self.file = file
    self.tile_dir = tile_dir
  end

  def make
    zoom_range, base_zoom = zooms
    self.base_zoom = base_zoom
    zoom_range.each do |zoom|
      make_tile(zoom)
    end
    zoom_range
  end

  private

  def zooms
    self.width = `identify -format "%w" #{file}`.to_i
    self.height = `identify -format "%h" #{file}`.to_i
    base = width > height ? width : height
    max_zoom = (Math.log(base) / Math.log(2)).ceil
    min_zoom = (Math.log(TILE_SIZE) / Math.log(2)).to_i
    [min_zoom..(max_zoom + 1), max_zoom]
  end

  def calculate_params(zoom)
    scale = (2**(zoom - base_zoom)).to_f
    width = (self.width * scale).to_i
    height = (self.height * scale).to_i
    tiles_per_column = (width.to_f / TILE_SIZE).ceil
    tiles_per_row = (height.to_f / TILE_SIZE).ceil
    [scale, tiles_per_column, tiles_per_row]
  end

  def make_marge_file(scale, tiles_per_column, tiles_per_row)
    # make resize image
    tmp = Tempfile.new(['tmp', '.png'])
    tmp.close
    `vips resize #{file} #{tmp.path} #{scale}`
    # make background image
    bg_width = tiles_per_column * TILE_SIZE
    bg_height = tiles_per_row * TILE_SIZE
    bg_file = Tempfile.new(['bg', '.png'])
    bg_file.close
    `convert -size #{bg_width}x#{bg_height} xc:none #{bg_file.path}`
    # make marge image
    merge_file = Tempfile.new(['merge', '.png'])
    merge_file.close
    `vips composite2 #{bg_file.path} #{tmp.path} #{merge_file.path} source --x 0 --y 0`
    tmp.delete
    bg_file.delete
    merge_file
  end

  def crap_images(working_dir, tiles_per_column, tiles_per_row, zoom, merge_file)
    puts `identify #{merge_file.path}`
    # crop image
    n = 0
    row = 0
    column = 0
    total_files = tiles_per_column * tiles_per_row
    (n...total_files).each do |i|
      tilebase = File.join(working_dir, "#{zoom}_#{i}.png")
      top = row * TILE_SIZE
      left = column * TILE_SIZE
      puts "vips extract_area #{merge_file.path} #{tilebase} #{left} #{top} #{TILE_SIZE} #{TILE_SIZE}"
      `vips extract_area #{merge_file.path} #{tilebase} #{left} #{top} #{TILE_SIZE} #{TILE_SIZE}`
      column += 1
      if column >= tiles_per_column
        column = 0
        row += 1
      end
    end
    merge_file.delete
  end

  def generate_tiles(working_dir, zoom, tiles_per_column)
    total_tiles = Dir[File.join(working_dir, "#{zoom}_*.png")].length
    n = 0
    row = 0
    column = 0

    (n...total_tiles).each do |i|
      filename = File.join(working_dir, "#{zoom}_#{i}.png")
      target = File.join(tile_dir, zoom.to_s, "#{column}_#{row}.png")
      `cp -f #{filename} #{target}`
      column += 1
      if column >= tiles_per_column
        column = 0
        row += 1
      end
    end
  end

  def make_tile(zoom)
    scale, tiles_per_column, tiles_per_row = calculate_params(zoom)

    output_dir = File.join(tile_dir, zoom.to_s)
    FileUtils.mkdir_p(output_dir) unless File.exist?(output_dir)

    Dir.mktmpdir do |working_dir|
      merge_file = make_marge_file(scale, tiles_per_column, tiles_per_row)
      crap_images(working_dir, tiles_per_column, tiles_per_row, zoom, merge_file)
      generate_tiles(working_dir, zoom, tiles_per_column)
    end
  end
end
