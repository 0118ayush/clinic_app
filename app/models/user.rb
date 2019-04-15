class User < ActiveRecord::Base

  has_many :bookings
  has_many :clinics, through: :bookings

  validates :name, presence: true
  validates :postcode, presence: true
  validates :dob, presence: true

end
