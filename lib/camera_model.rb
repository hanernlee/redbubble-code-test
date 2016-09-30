class CameraModel
  attr_accessor :name, :make, :images

  def initialize(options)
    @name = options[:name]
    @make = options[:make]
    @images = []
  end

  def add_image(image)
    if @images.include?(image)
      @images
    else
      @images << image
    end
  end
end
