class Location < ActiveRecord::Base
  METERS_PER_MILE = 1609.344
  belongs_to :city
  belongs_to :state
  belongs_to :country
  validates :city_id, :presence=> true
  geocoded_by :location_name
  before_save :callback_before_save

  define_index do
    indexes location_name
    has "RADIANS(latitude)",  :as => :latitude,  :type => :float
    has "RADIANS(longitude)",  :as => :longitude, :type => :float
    set_property :latitude_attr => :latitude, :longitude_attr => :longitude
    set_property :delta => true
  end

  def self.ts_search(state, near, within, limit=4)
    within = (within || 5)
    hash_conditions = {:geo => near, :with => {"@geodist" => 0.0..(within.to_i*METERS_PER_MILE)},
      :match_mode => :all, :order => "@geodist ASC"}
    self.search(state, hash_conditions)[0..limit-1]
  end
  
  def self.find_or_update(city_id, state_id, country_id, location_name = nil)
    location = self.where(:city_id => city_id, :state_id => state_id, :country_id =>country_id).first
    unless location
      Location.create(:city_id => city_id, :state_id => state_id, :country_id =>country_id, :location_name => location_name)
    end
  end

  def city_name
    city.name
  end

  def state_name
    state ? state.name  ? state.name : state.code : ""
  end

  protected
  def callback_before_save
    unless self.location_name
      address = []
      address << city_name
      address << state_name
      address << country.name if country
      self.location_name = address.compact.join(', ')
    end
  end
end