require 'data_mapper'
require 'dm-postgres-adapter'

class Space
  include DataMapper::Resource

  property :id, Serial
  property :name, Text
  property :desc, Text
  property :price, Text
  property :date, String

  belongs_to :user
end
