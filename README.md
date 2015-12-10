# UserPrivateMessages

[![Gem Version](https://badge.fury.io/rb/user_private_messages.svg)](https://badge.fury.io/rb/user_private_messages)
![Compatibility](https://img.shields.io/badge/Rails-4-green.svg)

This gem provides basic private messaging functionality between the users
of a site. Easy and simple setup, and simple database relations.
Rails 4 compatible.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'user_private_messages'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install user_private_messages

First create the private message model by running the simple_private_messages:model
generator, passing two parameters - the name you want to use for the Message
model and the name of the User model.

For all examples in the readme, we will use Message and User.

    rails generate simple_private_messages:model User Message

Now add the following entry to the model which will have the messages

    has_private_messages

## Usage

Examples assume you're using Restful Authentication or AAA, with a user model
of User and message model of Message.

### Creating / sending a message:

    aleks = User.find_by_login("aleks")
    john = User.find_by_login("john")

    message = Message.new
    message.subject = "Hi, Aleks"
    message.body = "Long time no see"
    message.sender = aleks
    message.recipient = john
    message.save

### Reading a message

    message = Message.read_message(id, user)

Returns the message of the chosen id and ensures the passed user is either the
sender or the recipient. If unread, it checks to see if the passed user is the
recipient and if so marks the read_at timestamp.

You can also check if a message has been read with the following:

    message.message_read?

### Retrieving a user's received mail

    aleks = User.find_by_login("aleks")
    aleks.received_messages

The following will return aleks's number of unread messages:

    aleks.unread_message_count

Or the following for true or false on whether there are unread messages:

    aleks.unread_messages?

### Retrieving a user's sent mail

    aleks = User.find_by_login("aleks")
    aleks.sent_messages

### Custom finds

    aleks.sent_messages.where("read_at < ?", 2.days.ago)

### Deleting a message

    aleks = User.find_by_login("aleks")
    message = aleks.received_messages.find(3)
    message.mark_deleted(aleks)

This will look at a message and mark it read by the sender or recipient,
based on whichever Newman is. It now will no longer appear in Newman's
messages.

    smith = User.find_by_login("smith")
    message = smith.sent_messages.find(3)
    message.mark_deleted

Now that both sender and recipient have marked the message deleted, it
gets destroyed. Should a message be sent to oneself, it will be deleted
in one step due to the sender and recipient being the same.

## Scaffold

No scaffolding for now for Rails 4

## Mission

This repo is a continuation of the dead SimplePrivateMessages project. Our mission is to keep SimplePrivateMessages alive and moving forward, with maintenance fixes and new features. Pull Requests are welcome!

## Contributing

1. Fork it ( https://github.com/Aleksandaar/user-private-messages/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
