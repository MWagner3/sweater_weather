class Image
  attr_reader :location,
              :image_url,
              :credit

  def initialize(image_data, location)
    @location = location
    @image_url = image_data[:results][0][:urls][:raw]
    @credit = {
      photographer: image_data[:results][0][:user][:name],
      photographer_profile_link: image_data[:results][0][:user][:links][:html],
      source: "https://unsplash.com/"
    }
  end
end
