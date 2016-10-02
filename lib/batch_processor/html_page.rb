require 'batch_processor/template_factory'

module BatchProcessor
  class HTMLPage
    def self.index(data,directory)
      options = {title: "RedBubble's Coding Test", item: data.camera_makes, images: data.index_page_images.take(10), index: true }
      index = TemplateFactory.new(options)
      index.save(directory + "/index.html")
    end

    def self.makes(data,directory)
      data.camera_makes.each do |camera_make|
        file_name = camera_make.name.downcase.gsub(" ","_")
        options = {title: camera_make.name, item: camera_make.models, images: camera_make.images  }
        page = TemplateFactory.new(options)
        page.save(directory + "/#{file_name}.html")
      end
    end

    def self.models(data,directory)
      data.models.each do |camera_model|
        file_name = camera_model.name.downcase.gsub(" ","_")
        options = { title: camera_model.name, item: camera_model.make, images: camera_model.images }
        page = TemplateFactory.new(options)
        page.save(directory + "/#{file_name}.html")
      end
    end
  end
end
