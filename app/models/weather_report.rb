class WeatherReport < ApplicationRecord

  belongs_to :city, class_name: 'Location'
  has_one :note

  WEATHER_TYPES = %w[Thunderstorm Drizzle Rain Snow Mist Smoke Haze Dust Fog Sand Ash Squall Tornado Clear Clouds].freeze

  def initialize(attributes)
    super
    result = WeatherService.new(city: attributes[:city].name).current_weather
    self.weather = result[:weather]
    self.temperature = result[:temperature]
  end

end