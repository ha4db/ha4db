# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RegularInspection, type: :model do
  before do
    @bridge = FactoryBot.create(:bridge)
    @regular_inspection = FactoryBot.build(:regular_inspection, bridge: @bridge)
  end

  subject { @regular_inspection }

  it { should respond_to(:title) }
  it { should respond_to(:person_responsible) }
  it { should respond_to(:periodic_inspection_date) }
  it { should respond_to(:record_updated_date) }
  it { should respond_to(:start_date) }
  it { should respond_to(:end_date) }

  it { should be_valid }

  describe 'when bridge is not present' do
    before { @regular_inspection.bridge = nil }
    it { should_not be_valid }
  end

  describe 'when title is not present' do
    before { @regular_inspection.title = ' ' }
    it { should_not be_valid }
  end
end
