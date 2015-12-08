require 'active_record'
require File.dirname(__FILE__) + '/../lib/has_private_messages_extensions'
require File.dirname(__FILE__) + '/../lib/private_message_extensions'
require File.dirname(__FILE__) + '/../lib/user_private_messages'

require 'byebug'
require 'thread'
require 'minitest/autorun'
begin require 'redgreen'; rescue LoadError; end

#ActiveRecord::Base.logger = Logger.new(File.dirname(__FILE__) + '/debug.log')
ActiveRecord::Base.configurations = YAML::load(IO.read(File.dirname(__FILE__) + '/database.yml'))
ActiveRecord::Base.establish_connection(:sqlite3)
fixture_path = File.dirname(__FILE__) + '/fixtures/'
ActiveSupport::Dependencies.autoload_paths << fixture_path
load(File.dirname(__FILE__) + '/schema.rb')

class Minitest::Test

  def create_user(options = {})
    return User.create({:login => "Aleksandar"}.merge(options))
  end

  def create_message(options = {})
    return Message.create({:sender => @john,
                           :recipient => @aleks,
                           :subject => "Hi, Aleks!",
                           :body => "Hello, Aleks! Long time no see."}.merge(options))
  end

end