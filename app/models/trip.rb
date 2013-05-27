class Trip < ActiveRecord::Base
  attr_accessible :end_date, :name, :start_date, :user_id, :city_id
  belongs_to :user
  belongs_to :city
  has_many :trip_places, dependent: :destroy
  validates :user, :city, :presence   => true
  validates :user_id, :uniqueness => { scope: :city_id, message: 'You already have a trip to that city.' }

  validate :trip_dates_valid, :trip_start_date_not_past

  def trip_dates_valid
    if end_date < start_date
      errors.add(:trip, "start date must be before end date")
    end
  end

  def trip_start_date_not_past
    if start_date < Date.today
      errors.add(:trip, "start date has already past")
    end
  end
end

