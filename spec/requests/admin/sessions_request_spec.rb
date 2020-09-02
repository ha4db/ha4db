# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin::Sessions', type: :request do # rubocop:disable Metrics/BlockLength
  describe 'GET /admin/sessions/index' do
    it 'show index view' do
      get admin_sessions_index_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /admin/sessions/login' do
    before do
      @admin_user = FactoryBot.create(:admin_user)
    end

    it 'enable to login' do
      post admin_sessions_login_path, params: {
        admin_user: {
          login_name: @admin_user.login_name,
          password: @admin_user.password
        }
      }
      expect(response).to redirect_to admin_top_index_path
    end

    it 'fail with invalid password' do
      post admin_sessions_login_path, params: {
        admin_user: {
          login_name: @admin_user.login_name,
          password: 'pass0000'
        }
      }
      expect(response).to have_http_status(200)
      expect(response.body).to include 'password'
      expect(response.body).to include @admin_user.login_name
    end
  end

  describe 'POST /admin/sessions/logout' do
    it 'enable to logout' do
      get admin_sessions_logout_path
      expect(response).to redirect_to admin_sessions_index_path
    end
  end
end
