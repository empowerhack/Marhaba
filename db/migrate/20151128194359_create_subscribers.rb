class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|

      t.timestamps
    end
  end
end
