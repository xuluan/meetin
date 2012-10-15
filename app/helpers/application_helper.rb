module ApplicationHelper
  def show_time(time)
    time.in_time_zone.strftime("%a %Y-%m-%d %I-%M%p")
    
  end
end
