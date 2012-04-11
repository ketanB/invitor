desc "Prepare DB"
task(:prepare_db => :environment) do
  TmpModel.set_table_name('tmp_categories')
  TmpModel.all.each do |table|
    Category.create(:country_id => 226, :name => table.name)
    puts table.inspect
  end
end