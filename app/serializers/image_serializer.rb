class ImageSerializer < BaseSerializer
  attributes :id, :img, :commentable_id, :commentable_type,
             :created_at, :updated_at, :img80x80

  def img
    object.img.url("320xAuto")
  end

  def img80x80
    object.img.url("80x80")
  end

  def created_at
    DateTime.parse(object.created_at.iso8601).strftime('%Y年%m月%d日 %H:%M')
  end

  def updated_at
    DateTime.parse(object.updated_at.iso8601).strftime('%Y年%m月%d日 %H:%M')
  end
end
