require 'active_record'

options = {
  adapter: 'postgresql',
  database: 'caffeinate'
}

ActiveRecord::Base.establish_connection( ENV['DATABASE_URL'] || options)
