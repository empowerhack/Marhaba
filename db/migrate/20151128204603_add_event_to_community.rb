class AddEventToCommunity < ActiveRecord::Migration
  def change
    add_reference :events, :community, index: true
  end
end
