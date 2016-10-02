require 'erb'

module BatchProcessor
  class TemplateFactory
    include ERB::Util

    def initialize(options)
      @title = options[:title]
      @items = options[:item]
      @images = options[:images]
      @index = options[:index] || false
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
