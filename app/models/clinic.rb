class Clinic < ActiveRecord::Base

  has_many :bookings
  has_many :users, through: :bookings

  validates :doctor_name, presence: true
  validates :clinic_name, presence: true
  validates :address, presence: true
  validates :postcode, presence: true

end
