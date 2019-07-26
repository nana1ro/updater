class Lesson < ApplicationRecord

  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader

  enum status: { 公開中: 0, 公開停止中: 1 }

  belongs_to :category
  belongs_to :rank
  has_many :attends
  has_many :users


  validates :category_id, :rank_id, :name, :description, :time, :status, presence: true
  validates :category_id, :rank_id, numericality: { only_integer: true }
  validates :name, length: { maximum: 20 }
  validates :description, length: { maximum: 500 }
  validates :time, numericality: { greater_than: 0 }


  def self.create_ranking
  	Lesson.find(Attend.group(:lesson_id).order('count(lesson_id) desc').limit(10).pluck(:lesson_id))
  end

end
