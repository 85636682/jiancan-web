module M1
  class Root < Grape::API
    version 'm1'

    default_error_formatter :json
    content_type :json, 'application/json'
    format :json
    formatter :json, Grape::Formatter::ActiveModelSerializers

    helpers M1::Helpers

    mount M1::Merchants
    mount M1::Shops
    mount M1::Orders
    mount M1::Categories
    mount M1::Rooms
    mount M1::Workers
    mount M1::Products
    mount M1::Areas
    mount M1::Weixins
    mount M1::Activities
    mount M1::ShopAdvertisements
    mount M1::UserCards
    mount M1::Coupons
    mount M1::Images
  end
end
