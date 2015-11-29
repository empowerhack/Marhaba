require 'twilio-ruby'

module TwilioSender
  def self.send_sms(subscribers, message)
    account_sid = ENV['twilio_sid']
    auth_token = ENV['twilio_auth_token']
    client = Twilio::REST::Client.new account_sid, auth_token

    from = ENV['twilio_number']

    subscribers.each do |subscriber|
      client.account.messages.create(
        :from => from,
        :to => subscriber,
        :body => message
      )
    end
  end
end
