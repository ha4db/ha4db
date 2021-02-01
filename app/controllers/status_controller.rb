# frozen_string_literal: true

# StatusController
class StatusController < ActionController::Base
  def index
    payload = {
      bridge_count: 0,
      message: nil
    }
    begin
      payload[:bridge_count] = Bridge.count
      render json: payload, status: :ok
    rescue => e # rubocop:disable Style/RescueStandardError
      payload[:message] = e.message
      render json: payload, status: :internal_server_error
    end
  end
end
