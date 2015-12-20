module V1
  class Users < Grape::API
    resource :users do
      desc "搜索用户"
      params do
        requires :showed, type: String, desc: "输入用户字符信息"
      end
      get 'search', each_serializer: UserSerializer, root: false  do
        users = User.where("mobile LIKE '%?%' OR nickname LIKE '%?%'", params[:showed])
        render users
      end
    end
  end
end
