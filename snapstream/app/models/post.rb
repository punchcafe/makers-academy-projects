class Post < ApplicationRecord
  mount_uploader :snap, SnapUploader
  belongs_to :user
  has_many :comments, dependent: :destroy
end
