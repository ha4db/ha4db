# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MlitImporter, type: :model do
  describe 'import' do
    context 'with mlit-testdata-001.xlsx' do
      it 'can read file' do
        file = File.join(File.dirname(__FILE__), '../testdata/mlit-testdata-001.xlsx')
        bridge = MlitImporter.import(file)
        expect(bridge.title).to eq('テスト橋')
        expect(bridge.address).to eq('千葉県千葉市若葉区テスト橋')
        expect(bridge.location.latitude).to eq(35.62694444444445)
        expect(bridge.location.longitude).to eq(140.16611111111112)
        expect(bridge.valid?).to eq(true)
      end
    end

    context 'with mlit-testdata-001-invalid.xlsx' do
      it 'cannot read file' do
        file = File.join(File.dirname(__FILE__), '../testdata/mlit-testdata-001-invalid.xlsx')
        bridge = MlitImporter.import(file)
        expect(bridge.title).to eq(nil)
        expect(bridge.address).to eq('千葉県千葉市若葉区テスト橋')
        expect(bridge.location.latitude).to eq(35.62694444444445)
        expect(bridge.location.longitude).to eq(140.16611111111112)
        expect(bridge.valid?).to eq(false)
      end
    end
  end
end
