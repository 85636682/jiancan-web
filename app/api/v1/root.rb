module V1
  class Root < Grape::API
    version 'v1'

    default_error_formatter :json
    content_type :json, 'application/json'
    format :json
    formatter :json, Grape::Formatter::ActiveModelSerializers

    helpers V1::Helpers

    mount V1::Shops
    mount V1::Workers
    mount V1::Products
    mount V1::Categories
    mount V1::Orders
    mount V1::Rooms

  end
end