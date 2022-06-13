class WeatherService
  class << self

    def conn
     Faraday.new(url: 'https://api.openweathermap.org',
      headers: { 'Content-type' => 'application/json'})
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def get_forcast(lat, lon)
      response = conn.get('/data/3.0/onecall') do |faraday|
        faraday.params['lat'] = lat
        faraday.params['lon'] = lon
        required_params.params['exclude'] = 'minutely,alerts'
        required_params.params['units'] = 'imperial'
        required_params.params['appid'] = ENV['openweather_appid']
      end
      parse_json(response)
    end

end
