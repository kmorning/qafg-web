class Meeting < ApplicationRecord
  serialize :time, Tod::TimeOfDay

  enum day: [:sunday,
             :monday,
             :tuesday,
             :wednesday,
             :thursday,
             :friday,
             :saturday]
  
  def time_str
    time.strftime("%l:%M %p") if time
  end

  def time_str=(val)
    self.time = Tod::TimeOfDay.try_parse(val)
  end
end
