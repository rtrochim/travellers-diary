class CovidService
  # Data provided by https://disease.sh/

  def initialize(params)
    @country = params[:country]
  end

  def todays_covid_data
    Rails.cache.fetch("covid/#{@country}", expires_in: 1.hour) do
      url = "https://disease.sh/v3/covid-19/countries/#{@country}"
      response = HTTP.get(url).parse.with_indifferent_access
      { cases: response[:todayCases],
        deaths: response[:todayDeaths],
        recovered: response[:todayRecovered] }
    end
  end
end
