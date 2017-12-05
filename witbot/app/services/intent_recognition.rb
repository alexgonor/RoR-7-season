class IntentRecognition
  CANCEL_ORDER_INTENT = 'cancel_order_present'

  INTENTS = %i[
    cancel_order
  ].freeze

  attr_accessor :string

  def initialize(string)
    self.string = string
  end

  def call
    INTENTS.detect { |intent| send("#{intent}_present?") }
  end

  def cancel_order_present?
    include_string?(CANCEL_ORDER_INTENT)
  end

  private

  def include_string?(string_intent)
    hash_result = WitBot::Message.new.send(string)

    intent = hash_result['entities']['intent']

    return unless intent

    intent[0].values_at('value')[0] == string_intent
  end
end
