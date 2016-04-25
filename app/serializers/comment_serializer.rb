class CommentSerializer < BaseSerializer
  attributes :id, :content, :user_id, :commentable_id, :commentable_type

  has_one :user, serializer: UserSerializer

  def created_at
    DateTime.parse(object.created_at.iso8601).strftime('%Y年%m月%d日 %H:%M')
  end

  def updated_at
    DateTime.parse(object.updated_at.iso8601).strftime('%Y年%m月%d日 %H:%M')
  end
end
