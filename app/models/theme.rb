class Theme < ActiveRecord::Base
  acts_as_taggable
  translates :name
    
  has_attached_file :bg_image, :styles => { :medium => "320x275>", :thumb => "80x70>" },
    :url => '/system/:class/bg_image/:id/:style.:extension',
    :path => ":rails_root/public/system/:class/bg_image/:id/:style.:extension"
  has_attached_file :main_image, :styles => { :medium => "160x140>", :thumb => "40x35>" },
    :url => '/system/:class/main_image/:id/:style.:extension',
    :path => ":rails_root/public/system/:class/main_image/:id/:style.:extension"
  has_and_belongs_to_many :categories
  belongs_to :category

  


  scope :defaults, where("`default` = ?", true)

  def self.by_category(category_id = nil, offset = 0)
    
    if category_id.to_i > 0
      cat = Category.find(category_id)
      result = cat.themes
    else
      result = self.limit(30)
      result = result.includes(:translations)
      result = result.offset(offset) if offset > 0
      result = result.where(:default => true)
    end
    result
  end

  def self.by_category_and_country(category_id = nil, country_id = nil, offset = 0)

    if category_id.to_i > 0
      cat = Category.find(category_id)
      result = cat.themes
    else
      result = self.limit(30)
      result = result.includes(:translations)
      result = result.offset(offset) if offset > 0
      result = result.where(:default => true)
    end
    result
  end

end
