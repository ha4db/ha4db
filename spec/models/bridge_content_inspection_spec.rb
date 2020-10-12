# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BridgeContentInspection, type: :model do
  before do
    @bridge_content_inspection = FactoryBot.build(:bridge_content_inspection)
  end

  subject { @bridge_content_inspection }

  it { should respond_to(:data) }
  it { should respond_to(:bridge_content) }
  it { should respond_to(:inspection) }
  it { should respond_to(:seek) }
  it { should respond_to(:position) }
  it { should be_valid }
end
