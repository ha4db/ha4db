# frozen_string_literal: true

# User Base Controller
class UserBaseController < ApplicationController
  include UserSessionAction
  layout 'user'
  before_action :let_user_login
end
