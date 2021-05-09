class WeatherService
  # Data provided by https://openweathermap.org

  def initialize(params)
    @city = params[:city]
  end

  def current_weather
    api_key = Rails.application.credentials.dig :openweathermap, :api_key
    url = "https://api.openweathermap.org/data/2.5/weather?q=#{@city}&appid=#{api_key}&units=metric"
    response = HTTP.get(url).parse.with_indifferent_access
    { weather: response[:weather].first[:main],
      temperature: response[:main][:temp].round }
  end
end
