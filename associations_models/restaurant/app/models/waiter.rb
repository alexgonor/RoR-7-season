class Waiter < ApplicationRecord
  belongs_to :cook
  has_many :visitors
end
