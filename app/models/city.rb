class City < ActiveRecord::Base
  translates :name
  scope :active, where(:active => true)
  belongs_to :country
  belongs_to :state
  belongs_to :city_translations, :class_name => 'CityTraslations'
end
