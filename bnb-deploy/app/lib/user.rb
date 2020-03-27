require 'active_record'
require 'pg'

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: 'dd11a2o63f6s31',
  host: 'ec2-79-125-4-96.eu-west-1.compute.amazonaws.com',
  user: 'ghhlhkokknhsuu',
  port: '5432',
  password: 'ea18730c4fbd14e07517650bdf76181c02ec8b2493717ec7b0185f0a408ade3a'
)

class User < ActiveRecord::Base
end
