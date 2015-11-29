class Event < ActiveRecord::Base
  belongs_to :host
  belongs_to :community
  validates_presence_of :title
  validates_presence_of :date_and_time
  validates_presence_of :location
  validates_presence_of :community_id

  scope :later_than_today, lambda{ where("date_and_time > ?", Date.today) }
end
