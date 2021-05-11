class CovidReport < ApplicationRecord

  belongs_to :country, class_name: 'Location'
  has_many :notes
  validates :cases, numericality: { only_integer: true }
  validates :deaths, numericality: { only_integer: true }
  validates :recovered, numericality: { only_integer: true }

  def get_data
    result = CovidService.new(country: country.name).todays_covid_data
    self.cases = result[:cases]
    self.deaths = result[:deaths]
    self.recovered = result[:recovered]
    self
  end

end