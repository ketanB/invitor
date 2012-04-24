class Pattern < ActiveRecord::Base
  belongs_to :category
  has_attached_file :image, :styles => { :medium => "320x275>", :thumb => "80x70>" },
    :url => '/system/:class/image/:id/:style.:extension',
    :path => ":rails_root/public/system/:class/image/:id/:style.:extension"
end
