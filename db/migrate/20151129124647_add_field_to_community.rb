class AddFieldToCommunity < ActiveRecord::Migration
  def change
    add_column :communities, :name, :string
    add_column :communities, :country, :string
  end
end
