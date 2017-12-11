class MessageCreator
  attr_accessor :params, :user

  def initialize(params, user)
    self.params = params
    self.user = user
  end

  def call
    params[:output] = IntentRecognition.new(params[:input]).intent

    user.messages.create(params)
  end
end
