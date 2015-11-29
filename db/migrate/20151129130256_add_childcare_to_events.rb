class AddChildcareToEvents < ActiveRecord::Migration
  def change
    add_column :events, :childcare, :boolean
  end
end
