class MapQuestService
  class << self

    def conn
     Faraday.new(url: 'http://www.mapquestapi.com',
      headers: { 'Content-type' => 'application/json'})
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def get_coords_from_location(location)
      response = conn.get('/geocoding/v1/address') do |faraday|
        faraday.params['key'] = ENV['mapquest_key']
        faraday.params['location'] = location
      end
      parse_json(response)[:results][0][:locations][0][:latLng]
    end

  end
end
