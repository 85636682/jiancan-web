module U1
  class Root < Grape::API
    version 'u1'

    default_error_formatter :json
    content_type :json, 'application/json'
    format :json
    formatter :json, Grape::Formatter::ActiveModelSerializers

    helpers U1::Helpers

    mount U1::Users
    mount U1::ReceivingAddresses
  end
end
