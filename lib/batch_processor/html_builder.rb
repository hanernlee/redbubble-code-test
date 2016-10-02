require 'batch_processor/html_page'

module Redbubble
  class HTMLBuilder
    def self.build(data,directory)
      unless File.directory?(directory)
        FileUtils.mkdir(directory)
      end

      HTMLPage.index(data,directory)
      HTMLPage.makes(data,directory)
      HTMLPage.models(data,directory)
    end
  end
end
