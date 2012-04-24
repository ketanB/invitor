class BusinessCategory < ActiveRecord::Base
  translates :title

  has_attached_file :icon, :styles => {  :thumb => "127x104" }

  scope :active, where(:active => true)
  belongs_to :business_group
  has_and_belongs_to_many :companies, :join_table => 'companies_categories'
  def top_companies(limit = 4)
    Company.all(:conditions=>"business_group_id=#{self.business_group_id}", :limit=>limit)
  end

end
