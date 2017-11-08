class Country < ApplicationRecord
  belongs_to :plane
  has_many :sities, dependent: :destroy
end
