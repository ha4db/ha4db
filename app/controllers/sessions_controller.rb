# frozen_string_literal: true

# TopController path=/
class SessionsController < ApplicationController
  def index
    @user = User.new
  end

  def login
    user = User.find_by(login_name: params[:user][:login_name])
    if user&.authenticate(params[:user][:password])
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
    params.require(:user).permit(:login_name, :password)
  end

  def login_action(user)
    reset_session
    session[:user_id] = user.id
    redirect_to action: :index, controller: :top
  end

  def login_fail_action
    flash.now[:error] = t('controller.common.not_authenticated')
    @user = User.new login_params
    render :index
  end
end
