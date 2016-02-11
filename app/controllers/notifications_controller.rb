class NotificationsController < ApplicationController
  def create
    MessageSender.send_message(message)
    redirect_to root_url,
      success: 'Your message has been sent!'
  rescue Twilio::REST::RequestError => error
    p error.message
    redirect_to root_url,
      error: 'There was an error. Please try again.'
  end


  private
  def phone
    phone = "#{params[:phone]}"
  end
  def message
    "This is a message from #{params[:name]}" \
    ": #{params[:message]}"
  end

end
