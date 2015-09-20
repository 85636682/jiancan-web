module ApplicationHelper
  def formattime(time, options = {})
    options[:unit]
    options[:unit] = options[:unit].blank? ? "day" : options[:unit]
    case options[:unit]
    when "day"
      DateTime.parse(time.iso8601).strftime('%Y年%m月%d日') if time
    when "noYearOnlyDay"
      DateTime.parse(time.iso8601).strftime('%m月%d日') if time
    when "hour"
      DateTime.parse(time.iso8601).strftime('%Y年%m月%d日 %H:%M') if time
    when "noDayOnlyHour"
      DateTime.parse(time.iso8601).strftime('%H:%M') if time
    when "numberString"
      DateTime.parse(time.iso8601).strftime('%Y%m%d%H%M') if time
    end
  end
  
  def active_controller?(c_name = nil)
    raw('active') if controller_name == c_name
  end

  def active_controller_and_actioner?(c_name = nil, a_name = nil)
    raw('active') if controller_name == c_name && action_name == a_name
  end

  def markdown(desc)
    desc
  end
end
