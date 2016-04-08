require 'data_mapper'
require 'dm-postgres-adapter'

class Available
  include DataMapper::Resource

  property :id, Serial
  property :single_date, Text

  has n, :spaces, :through => Resource

end
