require 'erb'

module BatchProcessor
  class TemplateFactory
    include ERB::Util
    attr_accessor :title, :items

    def initialize(title,item,image,index)
      @title = title
      @items = item
      @images = image.take(10)
      @index = index
    end

    def save(file)
      File.open(file, "w+") do |content|
        content.write(render)
      end
    end

    private

    def render
      ERB.new(template).result(binding)
    end

    def template
      file = File.open("output_template.html")
      contents = file.read
      file.close
      %{#{contents}}
    end
  end
end