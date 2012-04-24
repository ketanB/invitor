# == Schema Info
# Schema version: 20100628151227
#
# Table name: countries
#
#  id           :integer(4)      not null, primary key
#  abbreviation :string(255)
#  name         :string(255)
#  created_at   :datetime
#  updated_at   :datetime

class Country < ActiveRecord::Base
  translates :name
  has_many :categories

  scope :active, where(:active => true)
end