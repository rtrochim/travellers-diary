Fabricator(:weather_report) do
  city
  weather { WeatherReport::WEATHER_TYPES.sample }
  temperature { Faker::Number.between(from: -30, to: 40) }
end

