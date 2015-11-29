class AddFieldsToHosts < ActiveRecord::Migration
  def change
    add_column :hosts, :name, :string
    add_column :hosts, :mobile, :string
  end
end
