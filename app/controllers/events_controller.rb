require 'twilio-ruby'

class EventsController < ApplicationController
  def index
    @events = Event.later_than_today.order(:date_and_time)
  end

  def new
    @event = Event.new
  end

  def create
    community = Community.find(params[:event][:community_id])
    @event = community.events.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'You have set up an event, and all members of your community have been automatically notified via email and/or SMS.' }

        message = "You are invited to #{@event.title} on #{@event.date_and_time.to_formatted_s(:short)} at #{@event.location}."

        message += " Women only, please." if @event.female_only
        message += " Children are welcome." if @event.children_welcome
        message += " Childcare will be provided." if @event.childcare

        mobile_numbers = community.subscribers.pluck('mobile')

        send_sms(mobile_numbers, message)
      else
        format.html { render :new }
      end
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:title, :location, :community_id, :female_only, :children_welcome, :childcare, :date_and_time)
  end

  def send_sms(subscribers, message)
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
