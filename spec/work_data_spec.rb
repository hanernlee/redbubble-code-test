require 'spec_helper'

describe BatchProcessor::WorkData do
  let(:camera_model) { BatchProcessor::CameraModel.new(name: "NIKON D80", make: "NIKON") }
  let(:camera_make) { BatchProcessor::CameraMake.new(name: "NIKON") }
  let(:work) { described_class.new }

  before do
    camera_model.add_image("1.jpg")
    camera_make.add_model(camera_model)
  end

  describe '.add_camera_make' do
    it { expect(work.add_camera_make(camera_make)).to include(camera_make) }

    it 'doesnt add duplciate camera makes' do
      work.add_camera_make(camera_make)
      expect(work.camera_makes).to eq([camera_make])
    end
  end

  describe '.models' do
    before { work.add_camera_make(camera_make) }

    it 'returns all camera models' do
      expect(work.models).to eq([camera_model])
    end
  end

  describe '.images' do
    before { work.add_camera_make(camera_make) }

    it 'returns all images' do
      expect(work.images).to match_array(['1.jpg'])
    end
  end
end
