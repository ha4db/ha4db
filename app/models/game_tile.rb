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
    self.width = `identify -ping -format "%w" #{file}`.to_i
    self.height = `identify -ping -format "%h" #{file}`.to_i
    base = width > height ? width : height
    max_zoom = (Math.log(base) / Math.log(2)).ceil
    min_zoom = 8
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
    `vips black #{bg_file.path} #{bg_width} #{bg_height}`
    # make marge image
    merge_file = Tempfile.new(['merge', '.png'])
    merge_file.close
    `vips insert #{bg_file.path} #{tmp.path} #{merge_file.path} 0 0`
    tmp.delete
    bg_file.delete
    merge_file
  end

  def crap_images(working_dir, zoom, merge_file)
    vips_opts = "--suffix .png --tile-size 256 --basename image_#{zoom} --depth one --overlap 0 --background 0"
    `vips dzsave #{merge_file.path} #{working_dir}/image #{vips_opts}`
    merge_file.delete
  end

  def generate_tiles(working_dir, zoom)
    search_file = File.join(working_dir, "image_#{zoom}_files", '0', '*.png')
    total_tiles = Dir[search_file]
    total_tiles.each do |file_path|
      base_name = File.basename(file_path, '.png')
      target = File.join(tile_dir, zoom.to_s, "#{base_name}.png")
      `cp -f #{file_path} #{target}`
    end
  end

  def make_tile(zoom)
    scale, tiles_per_column, tiles_per_row = calculate_params(zoom)

    output_dir = File.join(tile_dir, zoom.to_s)
    FileUtils.mkdir_p(output_dir) unless File.exist?(output_dir)

    Dir.mktmpdir do |working_dir|
      merge_file = make_marge_file(scale, tiles_per_column, tiles_per_row)
      crap_images(working_dir, zoom, merge_file)
      generate_tiles(working_dir, zoom)
    end
  end
end
