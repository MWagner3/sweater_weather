class CurrentAbridged
  attr_reader :temperature,
              :weather,
              :summary

  def initialize(data)

    @temperature = data[:temperature]
    @summary = data[:weather][0][:description]
  end
end
