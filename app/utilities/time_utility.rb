# frozen_string_literal: true

# Responsoble for time methods
module TimeUtility
  module_function

  def today
    Date.today
  end

  def yesterday
    Date.today - 1.day
  end

  def last_week
    Date.today - 1.week
  end

  def last_month
    Date.today - 1.month
  end

  def parse_interval(string)
    amount, period = string.split('_')
    amount.to_i.send(period)
  end

  def time_from(time)
    ((Time.now - time) / 1.day).floor
  end
end
