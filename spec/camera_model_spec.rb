require 'spec_helper'

describe BatchProcessor::CameraModel do
  let(:camera_model) { BatchProcessor::CameraModel.new({ name: "NIKON D80", make: "NIKON" })}

  describe '#add_image' do
    before { camera_model.add_image("1.jpg") }

    it 'adds camera images' do
      camera_model.add_image("2.jpg")
      expect(camera_model.images).to match_array(["1.jpg","2.jpg"])
    end

    it 'doesnt add duplciate camera models' do
      camera_model.add_image("1.jpg")
      expect(camera_model.images).to match_array(["1.jpg"])
    end
  end
end
