class ForecastService
  class << self

    def conn
     Faraday.new(url: 'https://api.openweathermap.org',
      headers: { 'Content-type' => 'application/json'})
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def get_weather(lat, lon)
      response = conn.get('/data/3.0/onecall') do |faraday|
        faraday.params['lat'] = lat
        faraday.params['lon'] = lon
        faraday.params['exclude'] = 'minutely,alerts'
        faraday.params['units'] = 'imperial'
        faraday.params['appid'] = ENV['openweather_appid']
      end
      parse_json(response)
    end

  end
end
