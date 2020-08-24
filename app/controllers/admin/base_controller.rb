# frozen_string_literal: true

module Admin
  # Admin Base Controller
  class BaseController < ApplicationController
    include AdminSessionAction
    layout 'admin'
    before_action :let_user_login
  end
end
