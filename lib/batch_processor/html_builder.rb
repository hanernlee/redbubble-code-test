require 'batch_processor/html_page'

module BatchProcessor
  class HTMLBuilder
    def self.build(data,directory)
      unless File.directory?(directory)
        puts "Creating #{directory} directory"
        FileUtils.mkdir(directory)
      end

      puts "Building HTML pages..."
      HTMLPage.index(data,directory)
      HTMLPage.makes(data,directory)
      HTMLPage.models(data,directory)
    end
  end
end
