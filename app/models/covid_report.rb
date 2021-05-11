class CovidReport < ApplicationRecord

  belongs_to :country, class_name: 'Location'
  has_many :notes

  def initialize(attributes)
    super
    result = CovidService.new(country: attributes[:country].name).todays_covid_data
    self.cases = result[:cases]
    self.deaths = result[:deaths]
    self.recovered = result[:recovered]
  end

end