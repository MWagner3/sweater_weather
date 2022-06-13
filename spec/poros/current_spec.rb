require 'rails_helper'

RSpec.describe Current do
  it 'creates a current poro' do
    current_data = {
                    datetime:1655083227,
                    sunrise: 1655027154,
                    sunset: 1655080425,
                    temperature: 200,
                    feels_like: 200,
                    humidity: 100,
                    uvi: 0,
                    visibility: 10000,
                    weather: [{id: 800, main: 'clear', description: "clear sky", icon: "01n"}],
               }


    current = Current.new(current_data)

    expect(current).to be_a(Current)
    expect(current.datetime).to be_a(Time)
    expect(current.sunrise).to be_a(Time)
    expect(current.sunset).to be_a(Time)
    expect(current.temperature).to be_a(Numeric)
    expect(current.feels_like).to be_a(Numeric)
    expect(current.humidity).to be_a(Integer)
    expect(current.uvi).to be_a(Numeric)
    expect(current.visibility).to be_a(Integer)
    expect(current.conditions).to be_a(String)
    expect(current.icon).to be_a(String)
  end
end
