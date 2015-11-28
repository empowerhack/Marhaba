class Community < ActiveRecord::Base
  has_many :subscribers
  has_many :events
end
