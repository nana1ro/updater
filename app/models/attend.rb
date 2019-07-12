class Attend < ApplicationRecord

  belongs_to :category
  belongs_to :lesson
  belongs_to :user

end
