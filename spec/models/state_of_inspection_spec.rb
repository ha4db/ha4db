# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StateOfInspection, type: :model do
  before do
    @regular_inspection = FactoryBot.create(:regular_inspection)
    @bridge_content = FactoryBot.create(:bridge_content)
    @state_of_inspection = FactoryBot.create(:state_of_inspection,
                                             regular_inspection: @regular_inspection,
                                             bridge_content: @bridge_content)
  end

  subject { @state_of_inspection }

  it { should respond_to(:regular_inspection) }
  it { should respond_to(:bridge_content) }
  it { should respond_to(:component_category) }

  it { should be_valid }

  describe 'when regular_inspection is not present' do
    before { @state_of_inspection.regular_inspection = nil }
    it { should_not be_valid }
  end

  describe 'when bridge_content is not present' do
    before { @state_of_inspection.bridge_content = nil }
    it { should_not be_valid }
  end

  describe 'when component_category is not present' do
    before { @state_of_inspection.component_category = nil }
    it { should_not be_valid }
  end
end
