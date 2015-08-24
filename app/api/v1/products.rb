module V1
  class Products < Grape::API
    resource :products do
      get ''
    end
  end
end