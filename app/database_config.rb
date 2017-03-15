require 'active_record'

options = {
  adapter: 'postgresql',
  database: 'caffeinate'
}

# ApplicationRecord.establish_connection(options)
ActiveRecord::Base.establish_connection(options)
