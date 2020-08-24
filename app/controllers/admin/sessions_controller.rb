# frozen_string_literal: true

module Admin
  # Admin Sessions Controller
  class SessionsController < Admin::BaseController
    before_action :let_user_login, only: %i[]
    def index
      @admin_user = AdminUser.new
    end

    def login
      user = AdminUser.find_by(login_name: params[:admin_user][:login_name])
      if user&.authenticate(params[:admin_user][:password])
        login_action(user)
      else
        login_fail_action
      end
    end

    def logout
      reset_session
      redirect_to({ action: :index }, { notice: t('controller.common.logout') })
    end

    private

    def login_params
      params.require(:admin_user).permit(:login_name, :password)
    end

    def login_action(user)
      reset_session
      session[:admin_user_id] = user.id
      redirect_to action: :list, controller: :top
    end

    def login_fail_action
      flash.now[:error] = t('controller.common.not_authenticated')
      @admin_user = AdminUser.new login_params
      render :index
    end
  end
end
