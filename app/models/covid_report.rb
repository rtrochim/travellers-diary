class CovidReport < ApplicationRecord

  belongs_to :country, class_name: 'Location'
end