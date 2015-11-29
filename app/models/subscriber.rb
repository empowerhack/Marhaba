class Subscriber < ActiveRecord::Base
  belongs_to :community
  validate :mobile_or_email_provided?

  def mobile_or_email_provided?
    if mobile.blank? && email.blank?
      errors[:base] << "You must provide either a mobile number or email"
    end
  end
end
