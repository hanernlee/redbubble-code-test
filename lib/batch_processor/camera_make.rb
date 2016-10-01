module BatchProcessor
  class CameraMake
    attr_accessor :name, :models

    def initialize(name)
      @name = name
      @models = []
    end

    def add_model(model)
      camera_model = @models.map { |current_model| current_model if current_model.name == model.name }.first

      camera_model ? model.images.map { |image| camera_model.add_image(image) } : @models << model
    end

    def images
      @models.map(&:images).flatten
    end
  end
end
