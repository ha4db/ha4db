# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BridgeMainContent, type: :model do
  before do
    @bridge_main_content = FactoryBot.build(:bridge_main_content)
  end

  subject { @bridge_main_content }

  it { should respond_to(:bridge_content) }
  it { should be_valid }
end
