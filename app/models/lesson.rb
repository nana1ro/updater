class Lesson < ApplicationRecord

  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader

  enum status: { 公開中: 0, 公開停止中: 1 }

  belongs_to :category
  belongs_to :rank
  has_many :attends
  has_many :users

end
