# frozen_string_literal: true

require 'fileutils'
require 'tmpdir'
require 'tempfile'
require 'json'

# GameTile class
class Pointcloud
  attr_accessor :file, :tile_dir, :extent, :center

  def initialize(file, tile_dir)
    self.file = file
    self.tile_dir = tile_dir
  end

  def make
    convert
    center
  end

  private

  def calculate_center
    center = {}
    center['x'] = (extent['maxx'].to_f + extent['minx'].to_f) / 2.0
    center['y'] = (extent['maxy'].to_f + extent['miny'].to_f) / 2.0
    center['z'] = (extent['maxz'].to_f + extent['minz'].to_f) / 2.0
    center
  end

  def convert
    FileUtils.mkdir_p("./#{tile_dir}")
    # fix coordinate system
    # /tmp should not be mounted to docker so I use native pdal
    `pdal translate #{file} .#{tile_dir}/temp.las -f filters.transformation --filters.transformation.matrix="1 0 0 1 0 0 1 1 0 -1 0 1 0 0 0 1"`
    # convert to 3d tiles
    `docker run --rm -v $(pwd):/data -it ha4db/py3dtiles py3dtiles convert /data#{tile_dir}/temp.las --out /data#{tile_dir}/tiles`
    # get metadata
    pdal_string = `pdal info .#{tile_dir}/temp.las`
    self.extent = JSON.parse(pdal_string)['stats']['bbox']['native']['bbox']
    self.center = calculate_center
    `rm .#{tile_dir}/temp.las`
  end
end
