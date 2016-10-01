module BatchProcessor
  class WorkData
    attr_reader :camera_makes, :images

    def initialize
      @camera_makes = []
    end

    def add_camera_make(camera_make)
      if @camera_makes.any? {|current_make| current_make.name == camera_make.name}
        existing_make = @camera_makes.find { |current_make| current_make.name == camera_make.name }
        existing_make.add_model(camera_make.models.first)
      else
        @camera_makes << camera_make
      end
    end

    def models
      @camera_makes.map(&:models).flatten
    end

    def images
      @camera_makes.map(&:images).flatten
    end
  end
end
