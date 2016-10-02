require 'spec_helper'
require 'fakefs/spec_helpers'

describe BatchProcessor::HTMLBuilder do
  include FakeFS::SpecHelpers
  let(:work) { BatchProcessor::WorkData.new }
  let(:camera_make) { BatchProcessor::CameraMake.new("NIKON") }
  let(:camera_model) { BatchProcessor::CameraModel.new(name: "NIKON D80", make: "NIKON") }
  let(:directory) {"output"}

  describe '.build' do

    before do
      camera_make.add_model(camera_model)
      work.add_camera_make(camera_make)
      FakeFS.activate!
      File.new("output_template.html","w+")
      described_class.build(work,directory)
    end

    it 'creates directory if it does not exist' do
      expect(File.directory?(directory)).to be true
      FakeFS.deactivate!
    end

    it 'creates index.html' do
      expect(File.exist?(directory + '/index.html')).to be true
      FakeFS.deactivate!
    end

    it 'creates camera make html' do
      expect(File.exist?(directory + '/nikon.html')).to be true
      FakeFS.deactivate!
    end

    it 'creates camera model' do
      expect(File.exist?(directory + '/nikon_d80.html')).to be true
      FakeFS.deactivate!
    end
  end
end
