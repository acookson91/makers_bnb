require 'data_mapper'
require 'dm-postgres-adapter'


class Space
  include DataMapper::Resource

  property :id, Serial
  property :name, Text
  property :desc, Text
  property :price, Text
  property :available_date, Text


  belongs_to :user
  has n, :bookings
end
