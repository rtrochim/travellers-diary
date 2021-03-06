class WeatherReport < ApplicationRecord

  belongs_to :city, class_name: 'Location'
  has_one :note
  validates :temperature, numericality: { only_integer: true }

  WEATHER_TYPES = %w[Thunderstorm Drizzle Rain Snow Mist Smoke Haze Dust Fog Sand Ash Squall Tornado Clear Clouds].freeze

  def get_data
    result = WeatherService.new(city: city.name).current_weather
    self.weather = result[:weather]
    self.temperature = result[:temperature]
    self
  end

end