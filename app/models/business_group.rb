class BusinessGroup < ActiveRecord::Base
  has_many :companies

  translates :title
  scope :active, where(:active => true)

end
