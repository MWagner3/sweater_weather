class BackgroundFacade
  class << self
    def image_data(location)
      image_data = ImageService.get_image(location)
      image_poro = Image.new(image_data, location)

    end
  end
end
