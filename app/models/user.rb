require 'data_mapper'
require 'dm-postgres-adapter'

class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String, required: true
  property :password, String, required: true

  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :password
  validates_format_of :email, as: :email_address

end
