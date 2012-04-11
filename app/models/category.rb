# == Schema Info
# Schema version: 20100628151227
#
# Table name: categories
#
#  id          :integer(4)      not null, primary key
#  country_id  :integer(4)
#  description :string(255)
#  name        :string(255)
#  created_at  :datetime
#  updated_at  :datetime

class Category < ActiveRecord::Base
  translates :name, :description
  has_and_belongs_to_many :countries
  has_many :design
  has_and_belongs_to_many :themes

  #scope :default_themes, themes.where('`default`=?', true)

  def self.by_country(country_id=nil, offset = 0)
    result = []
    unless country_id.nil?
      result = Country.find(country_id).categories
    else
      result = self.limit(18)
      result = result.includes(:translations)
      result = result.offset(offset) if offset > 0
      result = result.where(:country_id => country_id) 
    end
    
    result
  end
end