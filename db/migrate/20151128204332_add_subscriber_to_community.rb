class AddSubscriberToCommunity < ActiveRecord::Migration
  def change
    add_reference :subscribers, :community, index: true
  end
end
