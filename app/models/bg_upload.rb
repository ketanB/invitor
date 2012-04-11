class BgUpload < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image, :styles => { :medium => "330x220>", :thumb => "100x80>" }
end
