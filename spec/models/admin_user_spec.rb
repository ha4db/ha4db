# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  before do
    @admin_user = FactoryBot.build(:admin_user)
  end

  subject { @admin_user }

  it { should respond_to(:login_name) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }
end
