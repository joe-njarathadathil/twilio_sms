class MessageSender
  def self.send_message(message)
    new.send_message(message)
  end

  def initialize
    # To find TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN visit
    # https://www.twilio.com/user/account
    account_sid = 'ACd560a9de31be5884f278014cae320d04'
    auth_token  = 'fee95e5614f671d1aa8218511610507a'
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_message(message)
    @client.account.messages.create(
      from:  '+18474969267',
      to:    '+12246375302',
      body:  message
    )
  end

  private


end
