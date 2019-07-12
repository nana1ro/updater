class Category < ApplicationRecord

  has_many :attends
  has_many :lessons

end
