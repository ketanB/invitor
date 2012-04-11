# Load the rails application
require File.expand_path('../application', __FILE__)

#http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=da70a63ec10c1da3440f93401d887122&text=hello%20world&safe_search=1&content_type=1&sort=relevance&per_page=20
class Flickr
  Key = "da70a63ec10c1da3440f93401d887122"
  secret = "9dc8442d0bf588b7"
end

CARTOGRAPHER_GMAP_VERSION = 3
# Initialize the rails application

Invitar::Application.initialize!
