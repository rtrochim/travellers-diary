class Location < ApplicationRecord

  belongs_to :parent, class_name: 'Location'
  has_many :covid_reports
  has_many :weather_reports
  has_many :notes

  scope :city, -> { where.not parent_id: nil }
  scope :country, -> { where parent_id: nil }

end