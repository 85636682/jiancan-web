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
  end
end
