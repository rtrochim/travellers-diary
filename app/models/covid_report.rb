class CovidReport < ApplicationRecord

  belongs_to :country, class_name: 'Location'
  has_many :notes

  def get_data
    result = CovidService.new(country: country.name).todays_covid_data
    self.cases = result[:cases]
    self.deaths = result[:deaths]
    self.recovered = result[:recovered]
    self
  end

end