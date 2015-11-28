class Community < ActiveRecord::Base
  has_many :subscribers
end
