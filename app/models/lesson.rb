class Lesson < ApplicationRecord

  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader

  enum status: { 公開中: 0, 公開停止中: 1 }

  belongs_to :category
  belongs_to :rank
  has_many :attends
  has_many :users


  validates :category_id, :rank_id, :name, :description, :time, :status, presence: true
  validates :category_id, :rank_id, :time, numericality: { only_integer: true }
  validates :name, length: { maximum: 20 }
  validates :description, length: { maximum: 500 }


  def self.create_ranking
  	Lesson.find(Attend.group(:lesson_id).order('count(lesson_id) desc').limit(3).pluck(:lesson_id))
  end


  def display_time
  	if time >= 3600
  	  "#{time/3600}時間#{time%3600/60}分#{time%3600%60%60}秒"
  	elsif time < 3600 && time >= 60
  	  "#{time/60}分#{time%60}秒"
  	else
  	  "#{time}秒"
  	end
  end

end
