class MapQuestFacade
  class << self
    def coords(location)
      json = LocationService.get_coords_from_location(location)
    end
  end
end
