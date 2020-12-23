# frozen_string_literal: true

require 'rails_helper'

OUTPUT_PATH = '/tmp/out'
INPUT_FILE = Rails.root.join('spec', 'testdata', 'ortho_image.png')

RSpec.describe GameTile, type: :model do
  describe 'make tile' do
    before do
      game_tile = GameTile.new(INPUT_FILE, OUTPUT_PATH)
      @result = game_tile.make
    end

    it 'generate tiles' do
      check_file = File.join(OUTPUT_PATH, '8/0_0.png')
      expect(File).to exist(check_file)
      check_file = File.join(OUTPUT_PATH, '9/0_0.png')
      expect(File).to exist(check_file)
      check_file = File.join(OUTPUT_PATH, '9/0_1.png')
      expect(File).to exist(check_file)
      check_file = File.join(OUTPUT_PATH, '9/1_0.png')
      expect(File).not_to exist(check_file)
      expect(@result.first).to be(8)
      expect(@result.last).to be(10)
    end
  end
end
