require 'pubnub'
require 'singleton'

class PubnubExtension
  include Singleton

  def initialize
    @client = Pubnub.new(
        subscribe_key: 'sub-c-552866e6-d9e0-11e7-96e5-36e8e28b70d2',
        publish_key: 'pub-c-e6e9ead3-d250-4dc6-98ad-a3453433b077',
        :logger => Rails.logger,
        error_callback: lambda do |msg|
          puts "Error callback says: #{msg.inspect}"
        end,
        connect_callback: lambda do |msg|
          puts "CONNECTED: #{msg.inspect}"
        end
    )
  end


  def client
    return @client
  end

end
