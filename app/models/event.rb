class Event < ActiveRecord::Base
  belongs_to :host
  belongs_to :community

  scope :later_than_today, lambda{ where("date_and_time > ?", Date.today) }
end
