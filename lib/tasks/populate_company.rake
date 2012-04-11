desc "Populate company from csv files + upload images"
task(:populate_company => :environment) do
  require 'fastercsv'
  require 'fileutils'


  t_path = "/home/invitar/google_full"
  #t_path = "/home/muntasim"
  c_path = "/home/invitar/completed_files/"
  #c_path = "/home/muntasim/completed_files/"
  Dir.chdir(t_path)

  Dir.glob("*.csv") do |file|
    i = -1

    I18n.locale = :en
    begin
      FasterCSV.foreach(file, :headers => true) do |row|
        i += 1
        next if i == 0 || row['name'].to_s == ''
        #break if i > 5
        state = State.find_or_create_by_code(row['state'])

        city = City.find_by_name(row['city'])
        if city.empty?
          city = City.create(:name =>row['city'])
        else
          city = city.first
        end

        b_group_name = file.split('_').first
        b_group = BusinessGroup.find_by_title(b_group_name)
        #raise b_group.first.id.inspect
        if b_group.empty?
          b_group = BusinessGroup.create(:title => b_group_name)
        else
          b_group = b_group.first
        end

        cat_ids = []
        cat_arr = row['category'].split(',')
        cat_arr.each do |cat|
          b_cat = BusinessCategory.find_by_title(cat)
          if b_cat.empty?
            b_cat = BusinessCategory.create(:title => cat, :business_group_id => b_group.id)
          else
            b_cat = b_cat.first
          end
          cat_ids << b_cat.id
        end
        #p row[19]
        #["state", "city", "zip_code", "name", "address", "phone", "Fax", "category", "site_url", "Email", "hours", "Average Price", "Ambiance", "Meals Served", "Cuisine", "Parking", "Reservations", "Services Provided", "Cost", "Features", "Type", "Average Entree", "Payment Accepted", "Wi-fi Hotspot", "url"]
        image_files =  Dir.glob(File.join(file.split('.').first ,(i-1).to_s, "*.jpg"))
        asset_photos = []
        image_files.each do |image_file|
          asset_photos << CompanyAsset.new(:photo => File.open(image_file, 'rb'))
        end

        c_attributes = []
        c_attributes << CompanyAttribute.new(:attribute_id => 1, :value=> row['Average Price']) if row['Average Price'] > ''
        c_attributes << CompanyAttribute.new(:attribute_id => 2, :value=> row['Ambiance'])  if row['Ambiance'] > ''
        c_attributes << CompanyAttribute.new(:attribute_id => 3, :value=> row['Meals Served'])  if row['Meals Served'] > ''
        c_attributes << CompanyAttribute.new(:attribute_id => 4, :value=> row['Cuisine']) if row['Cuisine'] > ''
        c_attributes << CompanyAttribute.new(:attribute_id => 5, :value=> row['Parking'])  if row['Parking'] > ''
        c_attributes << CompanyAttribute.new(:attribute_id => 6, :value=> row['Reservations']) if row['Reservations'] > ''
        c_attributes << CompanyAttribute.new(:attribute_id => 7, :value=> row['Services Provided']) if row['Services Provided'] > ''
        c_attributes << CompanyAttribute.new(:attribute_id => 8, :value=> row['Cost']) if row['Cost'] > ''
        c_attributes << CompanyAttribute.new(:attribute_id => 9, :value=> row['Features'])  if row['Features'] > ''
        c_attributes << CompanyAttribute.new(:attribute_id => 10, :value=> row['Average Entree']) if row['Average Entree'] > ''
        c_attributes << CompanyAttribute.new(:attribute_id => 'Average Price', :value=> row['Payment Accepted']) if row['Payment Accepted'] > ''
        c_attributes << CompanyAttribute.new(:attribute_id => 'Ambiance', :value=> row['Wi-fi Hotspot']) if row['Wi-fi Hotspot'] > ''


        company_data = {:phone=> row['phone'], :fax=> row['fax'], :city_id=>city.id, 	:state_id => state.id, :zip => row['zip_code'], :website=> row['site_url'],
          :email=>row['Email'], :business_group_id => b_group.id, 	:category_ids => cat_ids,
          :map_info=>row['url'], 	:hours=> row['hours'], :street1 => row['address'], :name => row['name'], :tag_list=> row['Type'],:company_attributes => c_attributes, :assets =>asset_photos
        }
        c = Company.create(company_data)
        puts "created #{c.id}"
      end
      File.move "#{t_path}/#{file}", c_path
      puts "moved file #{file}"
    rescue
      
    end
  end

end