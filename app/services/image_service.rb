class ImageService
  class << self

    def conn
      Faraday.new(url: 'https://api.unsplash.com',
      headers: { 'Content-type' => 'application/json'})
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def get_image(search)
      response = conn.get('search/photos') do |faraday|
        faraday.params['query'] = search
        faraday.params['client_id'] = ENV['unsplash_key']
      end
      parse_json(response)
    end

  end
end
