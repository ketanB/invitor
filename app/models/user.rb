class User < ActiveRecord::Base
  translates :firstname, :lastname
  belongs_to :role
  #has_one :details, :class_name => 'UserDetail'
  has_many :events
  has_many :comments
  has_many :contacts
  has_many :contact_groups

  
  acts_as_authentic do |c|
    c.login_field = :email
  end

  attr_protected :role_id

  after_create :register_user_to_fb
  

  def full_name
    "#{firstname} #{lastname}"
  end
  
  def deliver_password_reset_instructions!
    reset_perishable_token!
    Mailer.password_reset_instructions(self).deliver
  end

  def import(options = {})
    contain = begin
      address_books = Contacts.new(options['provider'], options['email'], options['password']).contacts
      address_books.blank? ? false : self.fill_contact(address_books)
    rescue Exception => e
      e
    end

    contain
  end

  def fill_contact(contacts)
    contacts.each do |contact|
      self.contacts << Contact.create({:full_name => contact.first, :email => contact.last})
    end

    true
  end


  ###################################Facebooker#########################

  #find the user in the database, first by the facebook user id and if that fails through the email hash
  def self.find_by_fb_user(fb_user)
    u = User.find_by_facebook_uid(fb_user.uid) || User.find_by_email_hash(fb_user.email_hashes)
  end

  #Take the data returned from facebook and create a new user from it.
  #We don't get the email from Facebook and because a facebooker can only login through Connect we just generate a unique login name for them.
  #If you were using username to display to people you might want to get them to select one after registering through Facebook Connect
  def self.create_from_fb_connect(fb_user)
    new_facebooker = User.new( :password => "", :email => "", :firstname => fb_user.name)
    new_facebooker.facebook_uid = fb_user.uid.to_i
    #We need to save without validations
    new_facebooker.save(false)
    new_facebooker.register_user_to_fb
  end

  #We are going to connect this user object with a facebook id. But only ever one account.
  def link_fb_connect(fb_user_id)
    unless fb_user_id.nil?
      #check for existing account
      existing_fb_user = User.find_by_fb_user_id(fb_user_id)
      #unlink the existing account
      unless existing_fb_user.nil?
        existing_fb_user.fb_user_id = nil
        existing_fb_user.save(false)
      end
      #link the new one
      self.fb_user_id = fb_user_id
      save(false)
    end
  end

  #The Facebook registers user method is going to send the users email hash and our account id to Facebook
  #We need this so Facebook can find friends on our local application even if they have not connect through connect
  #We hen use the email hash in the database to later identify a user from Facebook with a local user
  #facebooker-rails3 refectored to abc
  def register_user_to_fb
#    users = {:email => email, :account_id => id}
#    Facebooker::User.register([users])
#    self.email_hash = Facebooker::User.hash_email(email)
#    save(false)
  end

  def facebook_user?
    return !facebook_uid.nil? && facebook_uid > 0
  end

  ###################################Facebooker#########################

  def before_connect(facebook_session)
    self.firstname = facebook_session.user.name
  end

  def add_contacts(params)
    return false if params[:email_addresses].blank?

    contacts = params[:email_addresses].split(',')

    contacts.each do |contact|
      tmp_contact_arr = contact.split('[')
      tmp_email = tmp_contact_arr[0]
      tmp_name = ''
      tmp_name = tmp_contact_arr[1].gsub(/\]/, '') if tmp_contact_arr[1]
      Contact.create(:full_name => tmp_name, :email => tmp_email, :contact_group_id => params[:contact][:contact_group_id], :user_id => self.id)
    end
  end

  def event_response(event)
    guest = Guest.where(:user_id => self.id, :event_id => event.id).first
    return_str = 'Not Replied'
    if  guest
      case guest.response
     
      when 1
        return_str = 'You are attending'
      when 2
        return_str = 'You are not sure'
      when 3
        return_str = 'You are not attending'
      end
    end
    return_str
  end
end