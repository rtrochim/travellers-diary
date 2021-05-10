class Note < ApplicationRecord
  belongs_to :user
  belongs_to :city, class_name: 'Location'
  belongs_to :weather_report
  belongs_to :covid_report
end