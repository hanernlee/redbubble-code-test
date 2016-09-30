class CameraMake
  attr_accessor :name, :models

  def initialize(name)
    @name = name
    @models = []
  end

  def add_model(model)
    if @models.any? { |existing_model| existing_model.name == model.name}
      camera_model = @models.find { |existing_model| existing_model.name == model.name }
      model.images.each do |image|
        camera_model.add_image(image)
      end
    else
      @models << model
    end
  end

  def model_images
    images = []
    @models.each do |camera_model|
      camera_model.images.each do |image|
        images << image
      end
    end
    images
  end
end
