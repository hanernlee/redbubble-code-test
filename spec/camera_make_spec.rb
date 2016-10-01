require 'spec_helper'

describe BatchProcessor::CameraMake do
  let(:camera_make) { described_class.new(name: "NIKON") }

  # use instance double
  let(:camera_model_one) { BatchProcessor::CameraModel.new(name: "NIKON D80", make: "NIKON") }

  describe '.add_model' do
    before { camera_make.add_model(camera_model_one) }

    it { expect(camera_make.models).to include(camera_model_one) }

    it 'doesnt add duplciate camera models' do
      camera_make.add_model(camera_model_one)
      expect(camera_make.models).to eq([camera_model_one])
    end
  end

  describe '.images' do
    let(:camera_model_two) { BatchProcessor::CameraModel.new( name: "NIKON D80", make: "NIKON") }

    before do
      camera_model_one.add_image("1.jpg")
      camera_model_two.add_image("2.jpg")
      camera_make.add_model(camera_model_one)
      camera_make.add_model(camera_model_two)
    end

    it 'returns all images from camera models' do
      expect(camera_make.images).to match_array(["1.jpg","2.jpg"])
    end
  end
end
