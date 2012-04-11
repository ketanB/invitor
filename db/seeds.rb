require 'open-uri'

#creating users
User.create([
    {:login => "admin", :email => "admin@invitar.com", :password => "123456", :password_confirmation => "123456"},
    {:login => "user", :email => "user@41studio.com", :password => "123456", :password_confirmation => "123456"}
  ])

# Populating countries
Country.delete_all
open("http://openconcept.ca/sites/openconcept.ca/files/country_code_drupal_0.txt") do |countries|
  countries.read.each_line do |country|
    abbreviation, name = country.chomp.split("|")
    Country.create!(:name => name, :abbreviation => abbreviation)
  end
end

categories =
  ["Bakeries",
  "Boat charters",
  "Cards & stationery",
  "Caterers",
  "Djs",
  "Hotels",
  "Party & event planning",
  "Party supplies",
  "Personal chefs",
  "Photographers",
  "Venues & event spaces",
  "Wedding planning",
  "Limo services"]

categories.each do |cat|
  Category.create :name => cat, :country => Country.find_by_name('United States')
end

#populate language
Language.create!([
    {:code => "en", :name => "English"},
    {:code => "es", :name => "Spanish"}
  ])