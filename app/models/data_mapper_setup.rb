require_relative 'space'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/makers_bnb_#{ENV['RACK_ENV']}")
DataMapper.auto_migrate!
DataMapper.finalize
