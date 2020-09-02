# frozen_string_literal: true

# User Session action concern
module UserSessionAction
  extend ActiveSupport::Concern

  def let_user_login
    user_id = session[:user_id]
    unless user_id.blank?
      @current_user ||= User.find_by(id: user_id)
      return unless @current_user.nil?
    end
    alert = 'need to login'
    redirect_to(
      {
        controller: 'sessions',
        action: 'index'
      }, {
        alert: alert
      }
    )
  end
end
