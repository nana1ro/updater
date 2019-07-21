class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :attends, dependent: :destroy
  belongs_to :category, optional: true
  belongs_to :lesson, optional: true


  def self.recent_signups
    User.where(created_at: [1.week.ago..Time.zone.now])
  end


  def fullname
    last_name + first_name
  end

  def fullname_kana
    last_name_kana + first_name_kana
  end

  # TODO: 下記、lesson.rb内のdisplay_timeメソッドとまとめる方法を探す

  def display_learing_time
    if learning_time >= 3600
      "#{learning_time/3600}時間#{learning_time%3600/60}分#{learning_time%3600%60%60}秒"
    elsif learning_time < 3600 && learning_time >= 60
      "#{learning_time/60}分#{learning_time%60}秒"
    else
      "#{learning_time}秒"
    end
  end

  def display_target_time
    if target_time >= 3600
      "#{target_time/3600}時間#{target_time%3600/60}分#{target_time%3600%60%60}秒"
    elsif target_time < 3600 && target_time >= 60
      "#{target_time/60}分#{target_time%60}秒"
    else
      "#{target_time}秒"
    end
  end

end
