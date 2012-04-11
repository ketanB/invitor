# == Schema Info
# Schema version: 20100628151227
#
# Table name: languages
#
#  id         :integer(4)      not null, primary key
#  code       :string(255)
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime

class Language < ActiveRecord::Base
end