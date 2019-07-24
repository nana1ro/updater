module UsersHelper

  def rough_time(t)
  	if t >= 3600
      "#{t/3600}時間#{t%3600/60}分"
    else
      "#{t/60}分"
    end
  end

end
