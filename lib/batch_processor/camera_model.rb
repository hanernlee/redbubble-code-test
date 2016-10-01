module BatchProcessor
  class CameraModel
    attr_accessor :name, :make, :images

    def initialize(options)
      @name = options[:name]
      @make = options[:make]
      @images = []
    end

    def add_image(image)
      @images.include?(image) ? @images : @images << image
    end
  end
end
