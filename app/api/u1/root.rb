module U1
  class Root < Grape::API
    version 'u1'

    default_error_formatter :json
    content_type :json, 'application/json'
    format :json
    formatter :json, Grape::Formatter::ActiveModelSerializers

    helpers U1::Helpers

    mount U1::Settings
    mount U1::Users
    mount U1::ReceivingAddresses
    mount U1::Rooms
    mount U1::Orders
    mount U1::Shops
    mount U1::Activities
    mount U1::ShopAdvertisements
    mount U1::Categories
    mount U1::Products
    mount U1::Wx
    mount U1::Favorites
    mount U1::Comments
    mount U1::Bookings
    mount U1::Pay
    mount U1::OrderProducts
    mount U1::Coupons
  end
end
