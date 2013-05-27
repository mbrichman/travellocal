class Trip < ActiveRecord::Base
  attr_accessible :end_date, :name, :start_date, :user_id
end
