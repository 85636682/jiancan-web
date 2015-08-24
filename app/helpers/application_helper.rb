module ApplicationHelper
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
