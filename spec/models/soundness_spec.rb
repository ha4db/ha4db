# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe Soundness, type: :model do
  before do
    @soundness = FactoryBot.build(:soundness)
  end

  subject { @soundness }

  it { should respond_to(:bridge) }
  it { should respond_to(:evaluation) }
  it { should respond_to(:evaluation_at) }
  it { should respond_to(:overall_evaluation) }
  it { should be_valid }

  describe 'when evaluation is not present' do
    before { @soundness.evaluation = ' ' }
    it { should_not be_valid }
  end

  describe 'when evaluation_at is not present' do
    before { @soundness.evaluation_at = nil }
    it { should_not be_valid }
  end

  describe 'overall_evaluation' do
    describe 'enable to change by integer' do
      before { @soundness.overall_evaluation = 2 }
      subject { @soundness.two? }
      it { should eq(true) }
    end
  end

  describe 'count' do
    it 'up to 1' do
      soundness = Soundness.new(bridge: FactoryBot.create(:bridge))
      soundness.evaluation = 'test'
      soundness.evaluation_at = '2020/10/15'
      expect do
        soundness.save
      end.to change(Soundness, :count).by(1)
    end
  end
end
# rubocop:enable Metrics/BlockLength
