class ChatController < ApplicationController
  def new_message
    @client = Wit.new(access_token: "SP7VX4NCS2GCPRYCNSOGBHURP5I4H6UF")
  end
end
