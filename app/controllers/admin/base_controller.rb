# frozen_string_literal: true

# AdminBase Controller
class Admin::BaseController < ApplicationController
  include AdminSessionAction
  layout 'admin'
  before_action :let_user_login
end
