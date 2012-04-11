class EventAsset < ActiveRecord::Base
  has_attached_file :photo, :styles => { :medium => "500x325", :thumb => "65x50>" }
  belongs_to :event
end
