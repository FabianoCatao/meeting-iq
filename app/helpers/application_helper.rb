module ApplicationHelper
  def time_format(datetime)
    datetime.strftime('%H:%M   %d/%m/%y') unless datetime.blank?
  end
end
