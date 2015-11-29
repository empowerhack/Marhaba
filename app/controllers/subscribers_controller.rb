class SubscribersController < ApplicationController
  def new
    @subscriber = Subscriber.new
  end

  def create
    community = Community.find(params[:subscriber][:community_id])
    @subscriber = community.subscribers.new(subscriber_params)
    if @subscriber.save
      redirect_to success_path
    else
      render 'new'
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:name, :mobile, :email)
  end
end
