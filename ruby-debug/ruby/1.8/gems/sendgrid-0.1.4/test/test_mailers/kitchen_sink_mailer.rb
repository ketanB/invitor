class KitchenSinkMailer < ActionMailer::Base
  include SendGrid
  
  sendgrid_category :use_subject_lines

  def test_email
    recipients "dummy@dummy.com"
    from       "web@dummy.com"
    subject    "Test Email"
  end
end