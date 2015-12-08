require File.dirname(__FILE__) + '/../test_helper'

class MessageModelTest < Minitest::Test

  def setup
    @aleks = create_user(:login => "aleks")
    @john = create_user(:login => "john")
    @message = create_message
  end

  def test_create_message
    @message = create_message

    assert_equal @message.sender, @john
    assert_equal @message.recipient, @aleks
    assert_equal @message.subject, "Hi, Aleks!"
    assert_equal @message.body, "Hello, Aleks! Long time no see."
    assert @message.read_at.nil?
  end

  def test_read_returns_message
    assert_equal @message, Message.read_message(@message, @john)
  end

  def test_read_records_timestamp
    assert !@message.nil?
  end

  def test_read?
    Message.read_message(@message, @aleks)
    @message.reload
    assert @message.message_read?
  end

  def test_mark_deleted_sender
    @message.mark_deleted(@john)
    @message.reload
    assert @message.sender_deleted
  end

  def test_mark_deleted_recipient
    @message.mark_deleted(@aleks)
    @message.reload
    assert @message.recipient_deleted
  end

  def test_mark_deleted_both
    id = @message.id
    @message.mark_deleted(@aleks)
    @message.mark_deleted(@john)
    assert !Message.exists?(id)
  end

end