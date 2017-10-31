class Item < ApplicationRecord
  validates :name, presence: true,
                    length: { minimum: 5 }
  validates :price, presence: true,
                    numericality: { less_than_or_equal_to: 100 }
end
