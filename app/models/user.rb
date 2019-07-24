class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :attends, dependent: :destroy
  belongs_to :category, optional: true
  belongs_to :lesson, optional: true


  validates :last_name, :first_name, :last_name_kana, :first_name_kana, presence: true
  validates :last_name, :first_name, :last_name_kana, :first_name_kana, length: { maximum: 10 }
  validates :email, presence: true, length: { in: 5..50 }
  validates :target_time, numericality: { greater_than: 0 }
  validates :category_id, numericality: { only_integer: true }, allow_blank: true

  def self.recent_signups
    User.where(created_at: [1.week.ago..Time.zone.now])
  end


  def fullname
    last_name + first_name
  end

  def fullname_kana
    last_name_kana + first_name_kana
  end

end
