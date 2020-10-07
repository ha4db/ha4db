# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Inspection, type: :model do
  before do
    @inspection = FactoryBot.build(:inspection)
  end

  subject { @inspection }

  it { should respond_to(:title) }
  it { should respond_to(:report_data) }
  it { should respond_to(:bridge) }
  it { should respond_to(:category) }
  it { should respond_to(:date) }
  it { should be_valid }

  describe 'when title is not present' do
    before { @inspection.title = ' ' }
    it { should_not be_valid }
  end

  describe 'when date is not present' do
    before { @inspection.date = nil }
    it { should_not be_valid }
  end

  describe 'category' do
    describe 'enable to change by integer' do
      before { @inspection.category = 2 }
      subject { @inspection.superstructure_horizontal_grider? }
      it { should eq(true) }
    end
  end
end
