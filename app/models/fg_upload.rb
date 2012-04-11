class FgUpload < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image, :styles => { :medium => "400x340>", :thumb => "100x80>"},
    :url  => "/system/user_fg_images/:id/:style/:basename.:extension",
    :path => ":rails_root/public/system/user_fg_images/:id/:style/:basename.:extension"

  validates_attachment_presence :image
end
