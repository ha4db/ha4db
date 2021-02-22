# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe Bridge, type: :model do
  before do
    @bridge = FactoryBot.build(:bridge)
  end

  subject { @bridge }

  it { should respond_to(:title) }
  it { should respond_to(:address) }
  it { should respond_to(:location) }
  it { should respond_to(:soundnesses) }
  it { should respond_to(:regular_inspections) }
  it { should respond_to(:components) }
  it { should respond_to(:bridge_length) }
  it { should respond_to(:width) }

  it { should be_valid }

  describe 'when title is not present' do
    before { @bridge.title = ' ' }
    it { should_not be_valid }
  end

  describe 'when address is not present' do
    before { @bridge.address = ' ' }
    it { should_not be_valid }
  end

  describe 'when location is not present' do
    before { @bridge.location = nil }
    it { should_not be_valid }
  end

  describe 'full_title function' do
    describe 'without kana_title' do
      before { @bridge.title = 'test' }
      it { expect(@bridge.full_title).to eq('test') }
    end
    describe 'with kana_title' do
      before do
        @bridge.title = 'test'
        @bridge.kana_title = 'kana'
      end
      it { expect(@bridge.full_title).to eq('test (kana)') }
    end
  end
end
# rubocop:enable Metrics/BlockLength
