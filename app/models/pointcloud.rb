# frozen_string_literal: true

require 'fileutils'
require 'tmpdir'
require 'tempfile'

# GameTile class
class Pointcloud
  attr_accessor :file, :tile_dir, :extent, :center

  def initialize(file, tile_dir)
    self.file = file
    self.tile_dir = tile_dir
  end

  def make
    pdal_string = `pdal info #{file}`
    self.extent = JSON[pdal_string].stats.bbox.native.bbox
    self.center = calculate_extent
    convert
    self.center
    
  end

  private

  def calculate_extent
    center = Hash.new
    center[:x] = (self.extent.maxx + self.extent.minx) / 2.0
    center[:y] = (self.extent.maxy + self.extent.miny) / 2.0
    center[:z] = (self.extent.maxz + self.extent.minz) / 2.0
    center
  end

  def convert
    # fix coordinate system
    # /tmp should not be mounted to docker so I use native pdal
    `pdal translate #{file} temp.las -f filters.transformation --filters.transformation.matrix="0 0 1 1 0 -1 0 1 1 0 0 1 0 0 0 1"`
    # convert to 3d tiles
    `docker run --rm -v $(pwd):/data -it ha4db/py3dtiles py3dtiles convert /data#{tile_dir}/temp.las --out /data#{tile_dir}`
  end
end
