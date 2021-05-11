class Note < ApplicationRecord
  belongs_to :user
  belongs_to :city, class_name: 'Location'
  belongs_to :weather_report, dependent: :destroy
  belongs_to :covid_report

  after_destroy :destroy_orphan

  def set_reports
    city = Location.find(city_id)
    existing = CovidReport.find_by(country: city.parent, created_at: Time.current.all_day)
    self.weather_report = WeatherReport.new(city: city).get_data
    self.covid_report = existing || CovidReport.new(country: city.parent).get_data
  end

  def destroy_orphan
    covid_report.destroy if covid_report.notes.empty?
  end

end