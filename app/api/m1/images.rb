module M1
  class Images < Grape::API
    resource :images do
      desc '获取照片'
      params do
        requires :imageable_id, type: Integer, desc: '对象id'
        requires :imageable_type, type: String, desc: '对象名'
      end
      get '', each_serializer: ImageSerializer, root: false do
        @images = Image.where(imageable_id: params[:imageable_id], imageable_type: params[:imageable_type])
      end

      desc '上传照片'
      params do
        requires :image, type: Hash do
          requires :img, type: Hash, desc: '图片'
          requires :imageable_id, type: Integer, desc: '对象id'
          requires :imageable_type, type: String, desc: '对象名'
        end
      end
      post '', serializer: ImageSerializer, root: false do
        authenticate!
        @image = Image.new(params[:image])
        if @image.save
          render @image
        else
          error!({ error: "留言失败！" }, 400)
        end
      end

    end
  end
end
