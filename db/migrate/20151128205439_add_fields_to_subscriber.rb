class AddFieldsToSubscriber < ActiveRecord::Migration
  def change
    add_column :subscribers, :name, :string
    add_column :subscribers, :mobile, :string
    add_column :subscribers, :email, :string
  end
end
