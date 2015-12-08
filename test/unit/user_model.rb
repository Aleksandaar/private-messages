require File.dirname(__FILE__) + '/../test_helper'

class UserModelTest < Minitest::Test

  def setup
    @aleks = create_user(:login => "aleks")
    @message = create_message
  end

  def test_unread_messages?
    assert @aleks.unread_messages?
  end

  def test_unread_message_count
    assert_equal @aleks.unread_message_count, 1
  end
end