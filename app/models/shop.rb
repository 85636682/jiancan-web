class Shop < ApplicationRecord
  belongs_to :merchant
  has_many :products
  has_many :rooms
  has_many :orders
  has_many :categories
  has_many :workers
  has_many :food_materials
  has_many :comments, as: :commentable
  has_many :bookings
  has_many :coupons

  mount_uploader :avatar, ImageUploader
  attr_accessor :uploader_secure_token

  validates_uniqueness_of :name, :message => "你的店铺名称重复了"

  def update_location
    return if address == ""
    response = address_geocoding_location(address)
    location_info = JSON.parse(response.body)
    location = location_info["result"]["location"]
    update_attributes(lat: location["lat"], lng: location["lng"], location: "point(#{location["lng"]} #{location["lat"]})")
  end

  def address_geocoding_location(address)
    conn = Faraday.new(:url => "http://api.map.baidu.com") do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
    response = conn.get '/geocoder/v2/', { address: address, ak: Setting.baidu_map_ak, output: "json" }
  end

  def address
  #  "#{ChinaCity.get(province)}#{ChinaCity.get(city)}#{ChinaCity.get(district)}#{street}"
  end
end
