class WorkerSerializer < BaseSerializer
  attributes :id, :name, :login, :department, :department_text

  def created_at
    DateTime.parse(object.created_at.iso8601).strftime('%Y年%m月%d日 %H:%M')
  end

  def department_text
    object.department.text
  end
end
