class Location < ApplicationRecord

  belongs_to :city, class_name: 'Location'

  scope :city, -> { where.not parent_id: nil }
  scope :country, -> { where parent_id: nil }

  def parent
    Location.find(parent_id) unless parent_id.blank?
  end

end