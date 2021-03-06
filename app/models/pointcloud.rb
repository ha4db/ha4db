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
    puts "tiledir = #{tile_dir}"
    puts "file = #{file}"
    puts "pwd = #{Dir.pwd}"
    pwd = Dir.pwd
    pwd = '/srv/ha4db/app/shared' if Rails.env == 'production'
    # fix coordinate system
    # /tmp should not be mounted to docker so I use native pdal
    `pdal translate #{file} .#{tile_dir}/temp.las -f filters.transformation --filters.transformation.matrix="1 0 0 1 0 0 1 1 0 -1 0 1 0 0 0 1"`
    # convert to 3d tiles
    `docker run --rm -v #{pwd}:/data ha4db/py3dtiles py3dtiles convert /data#{tile_dir}/temp.las --out /data#{tile_dir}/tiles`
    # get metadata
    # use pdal 2.2.0
    pdal_string = `docker run --rm -v #{pwd}:/data ha4db/py3dtiles pdal info /data#{tile_dir}/temp.las`
    self.extent = JSON.parse(pdal_string)['stats']['bbox']['native']['bbox']
    self.center = calculate_center
    `rm .#{tile_dir}/temp.las`
  end
end
