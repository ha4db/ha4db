# frozen_string_literal: true

# PointcloudJob
class PointcloudJob < ApplicationJob
  queue_as :default

  def perform(bridge_content_id)
    bridge_content = BridgeContent.find_by_id(bridge_content_id)
    return if bridge_content.nil?

    return unless bridge_content.data_type.to_i == BridgeContent.data_types[:pointcloud]

    exec_perform(bridge_content)
  end

  private

  def exec_perform(bridge_content)
    bridge_content.data.open do |file|
      # target_dir needs local path for docker
      target_dir = File.join('/public', 'pointclouds', bridge_content.id.to_s)
      target_dir = File.join('/tmp', 'pointclouds', bridge_content.id.to_s) if Rails.env == 'test'
      FileUtils.rm_rf(target_dir)
      pointcloud = Pointcloud.new(file.path, target_dir)
      pointcloud_info = pointcloud.make
      bridge_content.pointcloud_info = pointcloud_info
      bridge_content.save
    end
  end
end
