require 'data_mapper'
require 'dm-postgres-adapter'

class Booking
  include DataMapper::Resource

  property :id, Serial
  property :booking_date, Text
  property :status, String, default: "Pending"

  belongs_to :user
  belongs_to :space

end
