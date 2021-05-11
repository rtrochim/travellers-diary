module WebmockHelper
  def stub_api_requests
    # Covid API
    stub_request(:get, /disease.sh/)
      .to_return(status: 200, body:
        '{"updated":1620762855418,"countryInfo":{"todayCases":3098,"todayDeaths":319,"todayRecovered":4211}}',
                headers: {'content-type':	'application/json; charset=utf-8'})
    # Weather API
    stub_request(:get, /api.openweathermap.org/)
      .to_return(status: 200, body:
        '{"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01n"}],
        "main":{"temp":19.29,"feels_like":19.15,"temp_min":18.33,"temp_max":20,"pressure":1004,"humidity":72}}',
                headers: {'content-type':	'application/json; charset=utf-8'})
  end
end