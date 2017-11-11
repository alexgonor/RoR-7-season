class Plane < ApplicationRecord
  belongs_to :flight
  has_many :countries, dependent: :destroy

  accepts_nested_attributes_for :countries

  mount_uploader :avatar, AvatarUploader

  self.per_page = 5
end
