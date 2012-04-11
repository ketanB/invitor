class Video < ActiveRecord::Base
  belongs_to :event

  before_save  {|record|
      record.embed_path.gsub!("width", "")
      record.embed_path.gsub!("height", "")
  }
end
