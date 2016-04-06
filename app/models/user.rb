require 'bcrypt'
require 'data_mapper'
require 'dm-postgres-adapter'

class User

  attr_reader :password

  include DataMapper::Resource

  property :id, Serial
  property :email, String, required: true, unique: true
  property :password_digest, Text, required: true

  validates_presence_of :email
  validates_presence_of :password
  validates_format_of :email, as: :email_address

  has n, :spaces
  has n, :bookings

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
  
  def self.authenticate(email, password)
    user = first(email: email)
    user ? user : nil
  end

end
