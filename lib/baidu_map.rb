module BaiduMap
  class << self
    def address_geocoding_location(address: "", output: "json", options = {})
      conn = Faraday.new(:url => "http://api.map.baidu.com") do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
      response = conn.get '/geocoder/v2/', { address: address, ak: Setting.baidu_map_ak, output: output }.merge(options)
    end
  end
end
