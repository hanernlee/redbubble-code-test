require 'batch_processor/template_factory'

module Redbubble
  class HTMLBuilder

    def self.build(data,directory)
      unless File.directory?(directory)
        FileUtils.mkdir(directory)
      end

      index_page(data,directory)
      camera_make_pages(data,directory)
      camera_model_pages(data,directory)
    end

    class << self
      def index_page(data,directory)
        index_page = true
        index = TemplateFactory.new("RedBubble Code Challenge", data.camera_makes, data.images, index_page)
        index.save(directory + "/index.html")
      end

      def camera_make_pages(data,directory)
        index_page = false
        data.camera_makes.each do |camera_make|
          normalize_name = camera_make.name.downcase.gsub(" ","_")
          page = TemplateFactory.new(camera_make.name, camera_make.models, camera_make.images, index_page)
          page.save(directory + "/#{normalize_name}.html")
        end
      end

      def camera_model_pages(data,directory)
        index_page = false
        data.models.each do |camera_model|
          normalize_name = camera_model.name.downcase.gsub(" ","_")
          page = TemplateFactory.new(camera_model.name, camera_model.make, camera_model.images, index_page)
          page.save(directory + "/#{normalize_name}.html")
        end
      end
    end
  end
end
