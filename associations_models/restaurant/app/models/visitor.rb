class Visitor < ApplicationRecord
  belongs_to :waiter
  has_one :menu
end
