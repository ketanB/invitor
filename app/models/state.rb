class State < ActiveRecord::Base
  translates :name

  scope :active, where(:active => true)
  belongs_to :country
  has_many :cities
end
