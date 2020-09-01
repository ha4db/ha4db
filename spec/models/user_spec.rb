# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  subject { @user }

  it { should respond_to(:login_name) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }

  it { should be_valid }

  describe 'when login_name is not present' do
    before { @user.login_name = ' ' }
    it { should_not be_valid }
  end

  describe 'when login_name is already taken' do
    before do
      with_same_login_name = @user.dup
      with_same_login_name.save
    end

    it { should_not be_valid }
  end

  describe 'when password is not present' do
    before do
      @user = FactoryBot.build(:user, password: '', password_confirmation: '')
    end
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = 'mismatch' }
    it { should_not be_valid }
  end

  describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = 'aaaaaa1' }
    it { should_not be_valid }
  end

  describe 'return value of authenticate method' do
    before { @user.save }
    let(:found_user) { User.find_by(login_name: @user.login_name) }

    describe 'with valid password' do
      it { should eq found_user.authenticate(@user.password) }
    end

    describe 'with invalid password' do
      let(:for_invalid_password) { found_user.authenticate('invalid') }

      it { should_not eq for_invalid_password }
      specify { expect(for_invalid_password).to be_falsey }
    end
  end

  describe 'when password format is invalid' do
    it 'should be invalid' do
      passwords = %w[a*8 11111111 abcd_1234]
      passwords.each do |invalid_password|
        @user.password = @user.password_confirmation = invalid_password
        expect(@user).not_to be_valid
      end
      @user.password = @user.password_confirmation = 'abcd 1234'
      expect(@user).not_to be_valid
    end
  end

  describe 'when password format is valid' do
    it 'should be valid' do
      passwords = %w[abcd1234 AbcdEFG1 1234567A]
      passwords.each do |valid_password|
        @user.password = @user.password_confirmation = valid_password
        expect(@user).to be_valid
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
