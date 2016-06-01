module C1
  class Root < Grape::API
    version 'c1'

    default_error_formatter :json
    content_type :json, 'application/json'
    format :json
    formatter :json, Grape::Formatter::ActiveModelSerializers

    helpers C1::Helpers

    mount C1::Orders
    mount C1::Couriers
  end
end
