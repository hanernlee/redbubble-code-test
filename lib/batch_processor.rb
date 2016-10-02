require 'batch_processor/work_data'
require 'batch_processor/camera_model'
require 'batch_processor/camera_make'
require 'batch_processor/html_builder'

module BatchProcessor
  def self.run(data,directory)
    raise(ArgumentError, "File type is invalid!") unless data.xpath('//work').count > 0

    work = WorkData.new

    data.xpath('//work').each do |node|

      image = xml_image(node).content.strip
      xml_make(node).nil? ? make = "Unknown" : make = xml_make(node).content
      xml_model(node).nil? ? model = "Unknown Model" : model = xml_model(node).content

      camera_model = CameraModel.new(name: model, make: make)
      camera_model.add_image(image)

      camera_make = CameraMake.new(make)
      camera_make.add_model(camera_model)

      work.add_camera_make(camera_make)
      work.add_index_page_images(image)
    end

    HTMLBuilder.build(work,directory)
  end

  def self.xml_image(node)
    node.at_xpath("urls//url[@type='small']")
  end

  def self.xml_make(node)
    node.at_xpath("exif//make")
  end

  def self.xml_model(node)
    node.at_xpath("exif//model")
  end
end
