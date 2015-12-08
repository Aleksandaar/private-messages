require 'active_record'

class Message < ActiveRecord::Base
  is_private_message
end