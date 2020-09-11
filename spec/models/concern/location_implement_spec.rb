# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LocationImplement do
  describe 'sexagesimal_to_float' do
    it 'value 35°37′37″ returns 35.62694444444445' do
      expect(LocationImplement.sexagesimal_to_float('35°37′37″')).to eq(35.62694444444445)
    end
  end

  describe 'float_to_sexagesimal' do
    it 'value 35.62694444 returns 35°37′37″' do
      expect(LocationImplement.float_to_sexagesimal(35.62694444)).to eq('35°37′37″')
    end
  end
end
