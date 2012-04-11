class CompanyAsset < ActiveRecord::Base
  has_attached_file :photo, :styles => { :medium => "330x270", :thumb => "80x70>" }
  belongs_to :company
end
