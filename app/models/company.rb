class Company < ActiveRecord::Base
  METERS_PER_MILE = 1609.344
  
  translates :name, :street1, :street2, :city_str, :state_str, :detail
  has_many :reviews, :as => :reviewable
  belongs_to :city
  belongs_to :state
  belongs_to :country
  has_many :assets, :class_name => 'CompanyAsset'
  has_many :company_attributes
  belongs_to :business_group
  
  has_many :taggings, :as => :taggable
  has_and_belongs_to_many :categories, :class_name => 'BusinessCategory', :join_table => 'companies_categories'

  validates :category_ids, :presence=> true
  validates :city_id, :presence=> true, :uniqueness => {:scope => [:phone, :zip]}
  
  geocoded_by :location_address
  
  accepts_nested_attributes_for :assets

  acts_as_taggable

  after_save :callback_after_save
  
  define_index do
    indexes key_words
    has city_id, rating, reviews_count
    has "latitude",  :as => :latitude,  :type => :float
    has "longitude",  :as => :longitude, :type => :float
    set_property :latitude_attr => :latitude, :longitude_attr => :longitude
    set_property :delta => true
  end

  def business_categories
    cat_titles = []
    categories.each do |cat|
      cat_titles << cat.title
    end
    cat_titles.join(', ')
  end
  def address
    "#{street1} #{street2}"
  end

  def city_name
    city ? city.name : city_str
  end

  def state_name
    state ? state.name  ? state.name : state.code : state_str
  end

  def location
    address = []
    address << city_name
    address << state_name
    address << zip if zip
    address << country.name if country
    address.compact.join(', ')
  end

  def location_address
    "#{address}, #{location}"
  end

  def build_keywords
    self.key_words = categories.map{|x| x.title}.concat(reviews.map{|x| x.comment}).
      push(name).push(location_address).push(phone).join(" ").split(" ").uniq.join(" ")
  end

  def lat_degree
    (self.latitude.to_f * 180)/Math::PI
  end

  def lng_degree
    (self.longitude.to_f * 180)/Math::PI
  end

  class << self
    def ts_search(args, per_page = 10)
      hash_conditions = {:geo => near(args), :with => with(args),
          :include => :company, :page => (args[:page] || 1), :per_page => per_page,
          :match_mode => :all, :order => order(args)}
      results = self.search(keywords(args), hash_conditions)
      return results
    end

    def ts_search_cities(args, limit=4)
      hash_conditions = {:geo => near(args), :match_mode => :all, :order => "@relevance DESC"}
      results = self.search(keywords(args), hash_conditions)
      results = results.map{|x| x.city_id}.uniq[0..limit-1]
      cities = City.find(results).map{|x| [x.id, x.name]}
      return cities
    end

    def keywords(args)
      key_words = args[:csz]
      unless args[:cat].blank?
        key_words = "#{key_words} #{args[:cat]}"
      end
      key_words
    end

    def near(args)
      args[:csz] = "NY" if args[:csz].blank?
      unless (args[:lat] && args[:lng])
        geo = geocoder_address(args[:csz])
        if geo
          args[:lat] = geo[0]
          args[:lng] = geo[1]
        else
          geo = geocoder_address("NY")
          args[:lat] = geo[0]
          args[:lng] = geo[1]
        end
      end
      return [args[:lat], args[:lng]]
    end

    def with(args, city = true)    
      with = {}
      if city && !args[:cities].blank?
        with[:city_id] = args[:cities].split(",").map{|x| x.to_i}
      end
      unless args[:dsn].blank?
        with["@geodist"] = 0.0..(args[:dsn].to_i*METERS_PER_MILE)
      end
      with
    end

    def order(args)
      if args[:hr].to_i == 1
        'rating DESC'
      elsif args[:mr].to_i == 1
        'reviews_count DESC'
      elsif !args[:csz].blank?
        "@relevance DESC"
      else
        ''
      end
    end

    def geocoder_address(address)
      geo=Geokit::Geocoders::MultiGeocoder.geocode(address)
      if geo.success
        lat = (geo.lat / 180.0) * Math::PI
        lng = (geo.lng / 180.0) * Math::PI
        return [lat, lng]
      else
        return nil
      end
    end
    
  end

  protected

  def callback_after_save
    #expire fragment on search page
    ActionController::Base.new.expire_fragment("search/company/#{id}")
    #rebuild keyword without callback
    Company.update_all("key_words = '#{build_keywords.gsub("'", "''")}'", "id = #{id}")
  end

end
