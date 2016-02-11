class NotificationsController < ApplicationController
  def create
    MessageSender.send_message(message,phone_number)
    redirect_to root_url,
      success: 'Your message has been sent!'
  rescue Twilio::REST::RequestError => error
    p error.message
    redirect_to root_url,
      error: 'There was an error. Please try again.'
  end

  def phone_number
    "#{params[:phone]}"
  end
  private

  def message
    "This is a message from #{params[:name]}" \
    ": #{params[:message]}"
  end

end
