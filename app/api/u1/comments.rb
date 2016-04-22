module U1
  class Comments < Grape::API
    resource :comments do
      desc '获取用户评论'
      params do
        requires :commentable_id, type: Integer, desc: '对象id'
        requires :commentable_type, type: String, desc: '对象名'
      end
      get '', each_serializer: CommentSerializer, root: false do
        @comments = Comment.where(commentable_id: params[:commentable_id], commentable_type: params[:commentable_type])
      end

      desc '添加用户评论'
      params do
        requires :comment, type: Hash do
          requires :content, type: String, desc: '留言内容'
          requires :score, type: Integer, desc: '评分'
          requires :commentable_id, type: Integer, desc: '对象id'
          requires :commentable_type, type: String, desc: '对象名'
        end
      end
      post '', serializer: CommentSerializer, root: false do
        authenticate!
        @comment = Comment.new(params[:comment])
        @comment.user_id = current_user.id
        if @comment.save
          @comment.commentable.comment_on if params[:comment][:commentable_type] == 'OrderProduct'
          render @comment
        else
          error!({ error: "留言失败！" }, 400)
        end
      end

    end
  end
end
