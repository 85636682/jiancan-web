class CommentSerializer < BaseSerializer
  attributes :id, :content, :user_id, :commentable_id, :commentable_type
end
