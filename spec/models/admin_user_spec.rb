# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
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

  it { should be_valid }

  describe 'when login_name is not present' do
    before { @admin_user.login_name = ' ' }
    it { should_not be_valid }
  end

  describe 'when login_name is already taken' do
    before do
      with_same_login_name = @admin_user.dup
      with_same_login_name.save
    end

    it { should_not be_valid }
  end

  describe 'when password is not present' do
    before do
      @admin_user = FactoryBot.build(:admin_user, password: '', password_confirmation: '')
    end
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @admin_user.password_confirmation = 'mismatch' }
    it { should_not be_valid }
  end

  describe "with a password that's too short" do
    before { @admin_user.password = @admin_user.password_confirmation = 'aaaaaa1' }
    it { should_not be_valid }
  end

  describe 'return value of authenticate method' do
    before { @admin_user.save }
    let(:found_admin) { AdminUser.find_by(login_name: @admin_user.login_name) }

    describe 'with valid password' do
      it { should eq found_admin.authenticate(@admin_user.password) }
    end

    describe 'with invalid password' do
      let(:admin_for_invalid_password) { found_admin.authenticate('invalid') }

      it { should_not eq admin_for_invalid_password }
      specify { expect(admin_for_invalid_password).to be_falsey }
    end
  end

  describe 'when password format is invalid' do
    it 'should be invalid' do
      passwords = %w[a*8 11111111 abcd_1234]
      passwords.each do |invalid_password|
        @admin_user.password = @admin_user.password_confirmation = invalid_password
        expect(@admin_user).not_to be_valid
      end
      @admin_user.password = @admin_user.password_confirmation = 'abcd 1234'
      expect(@admin_user).not_to be_valid
    end
  end

  describe 'when password format is valid' do
    it 'should be valid' do
      passwords = %w[abcd1234 AbcdEFG1 1234567A]
      passwords.each do |valid_password|
        @admin_user.password = @admin_user.password_confirmation = valid_password
        expect(@admin_user).to be_valid
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
