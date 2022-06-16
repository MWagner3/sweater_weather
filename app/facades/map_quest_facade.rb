class MapQuestFacade
  class << self
    def coords(location)
      json = MapQuestService.get_coords_from_location(location)
    end

    def travel_time(origin, destination)

      json = MapQuestService.get_travel_time(origin, destination)[:route][:formattedTime]
    end
  end
end


# if info[:routeError][:errorCode] == 2
#   return nil
# else
#   MapQuestService.get_travel_time(origin, destination)[:route][:formattedTime]
