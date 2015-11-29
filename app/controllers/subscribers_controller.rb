class SubscribersController < ApplicationController
  def new
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.create(subscriber_params)
    if @subscriber.save
      redirect_to events_path
    else
      render 'new'
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:name, :mobile, :email)
  end
end
