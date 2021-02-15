# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Diagnosis, type: :model do
  before do
    @bridge = FactoryBot.create(:bridge)
    @regular_inspection = FactoryBot.create(:regular_inspection)
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
    before { @diagnosis.result = Diagnosis.results[:two] }
    it { should_not be_valid }
  end
end
