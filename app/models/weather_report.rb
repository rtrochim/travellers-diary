class WeatherReport < ApplicationRecord

  belongs_to :city, class_name: 'Location'

  WEATHER_TYPES = %w[Thunderstorm Drizzle Rain Snow Mist Smoke Haze Dust Fog Sand Ash Squall Tornado Clear Clouds].freeze

end