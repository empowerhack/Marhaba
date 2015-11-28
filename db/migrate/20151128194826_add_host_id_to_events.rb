class AddHostIdToEvents < ActiveRecord::Migration
  def change
    add_reference :events, :host, index: true
  end
end
