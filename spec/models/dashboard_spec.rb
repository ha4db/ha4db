# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe Dashboard, type: :model do
  before do
    @bridge1 = FactoryBot.create(:bridge, year_in_service: 1981, kind_of_bridge: 1)
    @bridge2 = FactoryBot.create(:bridge)
    @bridge3 = FactoryBot.create(:bridge)
    @bridge4 = FactoryBot.create(:bridge, year_in_service: 2012, kind_of_bridge: 2)
    FactoryBot.create(:soundness, bridge: @bridge1, evaluation_at: '2018/05/21', overall_evaluation: 'one')
    FactoryBot.create(:soundness, bridge: @bridge2, evaluation_at: '2018/05/21', overall_evaluation: 'two')
    FactoryBot.create(:soundness, bridge: @bridge3, evaluation_at: '2018/05/21', overall_evaluation: 'three')
    @bridges = Bridge.includes(:soundnesses)
  end

  describe 'matrix_item' do
    context 'call matrix' do
      it 'return values' do
        result = Dashboard.matrix(@bridges)
        expect(result['2018']).not_to eq(nil)
        expect(result['2018']['one']).not_to eq(nil)
        expect(result['2018']['one']).to eq([@bridge1])
      end
      context 'with newer values' do
        before do
          FactoryBot.create(:soundness, bridge: @bridge1, evaluation_at: '2020/05/21', overall_evaluation: 'two')
        end
        it 'return newer values' do
          result = Dashboard.matrix(@bridges)
          expect(result['2018']).not_to eq(nil)
          expect(result['2018']['one']).to eq(nil)
          expect(result['2020']).not_to eq(nil)
          expect(result['2020']['two']).to eq([@bridge1])
        end
      end
    end
  end

  describe 'sorted_overall_evaluations' do
    it 'return sorted value' do
      result = Dashboard.sorted_overall_evaluations
      expect(result).to eq(%w[unselected four three two one])
    end
  end

  describe 'soundness_chart' do
    it 'return chart values' do
      result = Dashboard.soundness_chart(@bridges)
      expect(result['unselected']).to eq(1)
      expect(result['one']).to eq(1)
      expect(result['two']).to eq(1)
      expect(result['three']).to eq(1)
    end
  end

  describe 'priority_chart' do
    it 'return priority values' do
      result = Dashboard.priority_chart(@bridges)
      expect(result['priority_unselected']).to eq(4)
    end
  end

  describe 'kind_of_bridge_chart' do
    it 'return kink_of_bridge values' do
      result = Dashboard.kind_of_bridge_chart(@bridges)
      expect(result[1981]['concrete']).to eq(1)
    end
  end
end
# rubocop:enable Metrics/BlockLength
