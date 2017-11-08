class Menu < ApplicationRecord
  belongs_to :visitors
  has_many :dishes
end
