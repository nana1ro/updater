module Admins::LessonsHelper

  def detailed_time(t)
  	if t >= 3600
      "#{t/3600}時間#{t%3600/60}分#{t%3600%60%60}秒"
    elsif t < 3600 && t >= 60
      "#{t/60}分#{t%60}秒"
    else
      "#{t}秒"
    end
  end

end
