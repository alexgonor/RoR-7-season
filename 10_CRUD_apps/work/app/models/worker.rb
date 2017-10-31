class Worker < ApplicationRecord
  validates :name, presence: true,
                    length: { minimum: 5 }
  validates :salary, presence: true,
                    numericality: { greater_than_or_equal_to: 5000 }
end
