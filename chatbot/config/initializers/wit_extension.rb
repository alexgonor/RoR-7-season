require 'wit'
require 'singleton'

class WitExtension
  include Singleton

  def initializer
    access_token = "SP7VX4NCS2GCPRYCNSOGBHURP5I4H6UF"
    actions = {
        send: -> (request, response) {
          # do something when bot sends message
        },

        findRestaurants: -> (request) {
          #
        }
    }

    @client = Wit.new(access_token: access_token, actions: actions)
  end


  def client
    return @client
  end

  def set_conversation(conversation)
    @conversation = conversation
  end

end
