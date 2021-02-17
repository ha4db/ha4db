# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe Diagnosis, type: :model do
  before do
    @bridge = FactoryBot.create(:bridge)
    @regular_inspection = FactoryBot.create(:regular_inspection, bridge: @bridge)
    @diagnosis = FactoryBot.create(:diagnosis, regular_inspection: @regular_inspection)
  end

  subject { @diagnosis }

  it { should respond_to(:regular_inspection) }
  it { should respond_to(:component_category) }
  it { should respond_to(:result) }
  it { should respond_to(:injury) }
  it { should respond_to(:observation) }

  it { should be_valid }

  describe 'when result to two, it to be invalid' do
    before { @diagnosis.result = Diagnosis.diagnosis_results[:two] }
    it { should_not be_valid }
  end

  describe 'when result to two with injury' do
    before { @diagnosis.result = Diagnosis.diagnosis_results[:two] }
    describe 'with same component_category' do
      before do
        injury = FactoryBot.create(:injury, regular_inspection: @regular_inspection)
        @diagnosis.injury = injury
      end
      it { should be_valid }
    end
    describe 'with other component_category' do
      before do
        component = FactoryBot.create(:component, bridge: @bridge, component_category: Component.categories[:other])
        injury = FactoryBot.create(:injury, regular_inspection: @regular_inspection, component: component)
        @diagnosis.injury = injury
      end
      it { should_not be_valid }
    end
  end
end
# rubocop:enable Metrics/BlockLength
