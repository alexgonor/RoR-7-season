class Plane < ApplicationRecord
  belongs_to :flight
  has_many :countries, dependent: :destroy
end
