# frozen_string_literal: true

# AdminSession action concern
module AdminSessionAction
  extend ActiveSupport::Concern

  def let_admin_user_login
    admin_user_id = session[:admin_user_id]
    unless admin_user_id.blank?
      @current_admin_user ||= AdminUser.find_by(id: admin_user_id)
      return unless @current_admin_user.nil?
    end
    alert = 'need to login'
    redirect_to(
      {
        controller: 'admin/sessions',
        action: 'index'
      }, {
        alert: alert
      }
    )
  end
end
