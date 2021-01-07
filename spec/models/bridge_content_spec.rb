# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe BridgeContent, type: :model do
  before do
    @bridge_content = FactoryBot.build(:bridge_content)
  end

  subject { @bridge_content }

  it { should respond_to(:title) }
  it { should respond_to(:data) }
  it { should respond_to(:bridge) }
  it { should be_valid }

  describe 'when title is not present' do
    before { @bridge_content.title = ' ' }
    it { should_not be_valid }
  end

  describe 'bridge_content.data.content_type is image/jpeg' do
    subject { @bridge_content.data.content_type }
    it { should eq('image/jpeg') }
  end

  describe 'bridge_content.data.content_type is image/png' do
    before do
      @bridge_content.data = fixture_file_upload(Rails.root.join('spec', 'testdata', 'testimage.png'))
    end
    subject { @bridge_content.data.content_type }
    it { should eq('image/png') }
  end

  describe 'bridge_content.data.content_type is image/png' do
    before do
      @bridge_content.data = fixture_file_upload(Rails.root.join('spec', 'testdata', 'testmovie.mp4'))
    end
    subject { @bridge_content.data.content_type }
    it { should eq('video/mp4') }
  end

  describe 'bridge_content.data_type to ortho' do
    before do
      @bridge_content.data = fixture_file_upload(Rails.root.join('spec', 'testdata', 'ortho_image.png'))
      @bridge_content.data_type = BridgeContent.data_types[:ortho]
      perform_enqueued_jobs do
        @bridge_content.save
      end
    end
    it 'create new tiles' do
      check_file = File.join('/tmp', 'ortho_images', @bridge_content.id.to_s, '8/0_0.png')
      expect(File).to exist(check_file)
    end
  end
end
# rubocop:enable Metrics/BlockLength
