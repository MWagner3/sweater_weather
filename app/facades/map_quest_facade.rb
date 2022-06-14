class MapQuestFacade
  class << self
    def coords(location)
      json = MapQuestService.get_coords_from_location(location)
    end
  end
end
