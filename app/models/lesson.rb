class Lesson < ApplicationRecord

  belongs_to :category
  belongs_to :rank
  has_many :attends

end
