class Flight < ApplicationRecord
  has_many :planes, dependent: :destroy
end
