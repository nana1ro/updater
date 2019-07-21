class Attend < ApplicationRecord

  belongs_to :category
  belongs_to :lesson
  belongs_to :user


  def self.recent_attends
  	Attend.where(created_at: [1.week.ago..Time.zone.now])
  end

  def self.two_weeks_attends
  	Attend.where(created_at: [2.week.ago..1.week.ago])
  end

  def self.three_weeks_attends
  	Attend.where(created_at: [3.week.ago..2.week.ago])
  end

end
