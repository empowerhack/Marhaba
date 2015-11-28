class AddFieldsToEvent < ActiveRecord::Migration
  def change
    add_column :events, :title, :string
    add_column :events, :date_and_time, :datetime
    add_column :events, :location, :string
    add_column :events, :female_only, :boolean
    add_column :events, :children_welcome, :boolean
  end
end
