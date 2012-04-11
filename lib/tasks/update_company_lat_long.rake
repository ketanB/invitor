desc "Prepare DB"
task(:update_company_lat_long   => :environment) do
  Company.all.each do |company|
    company.fetch_coordinates!
  end
end

task(:populate_company_lat_long => :environment) do
  Company.where("longitude is null and latitude is null").limit(4500).each do |company|
    begin
      puts company.id
      company.fetch_coordinates!
    rescue Exception => ex
      puts ex
    end
  end
end