require 'active_record'

class User < ActiveRecord::Base
  has_private_messages
end