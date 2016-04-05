require 'data_mapper'
require 'dm-postgres-adapter'

class Space
  include DataMapper::Resource

  property :id, Serial
  property :name, Text
  property :desc, Text
  property :price, Text
  property :available_date, String

  belongs_to :user
end
