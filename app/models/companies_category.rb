class CompaniesCategory < ActiveRecord::Base
  belongs_to :company
  belongs_to :categories, :class_name => 'BusinessCategory'
end
