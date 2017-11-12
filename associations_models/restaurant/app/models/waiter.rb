class Waiter < ApplicationRecord
  belongs_to :cook
  has_many :visitors

  mount_uploader :avatar, AvatarUploader

  self.per_page = 2
end
