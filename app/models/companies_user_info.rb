class CompaniesUserInfo < ActiveRecord::Base

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_presence_of :email

  def validate
    if name.blank? && city_id.blank? && country_id.blank? && fax.blank? &&
        phone.blank? && state_id.blank? && street1.blank? && street2.blank? &&
        website.blank? && zip.blank? && is_closed.blank?
      errors.add_to_base("You must specify a new info for this company")
    end
  end

end
