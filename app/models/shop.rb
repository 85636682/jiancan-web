if defined? Yajl
  require 'yajl/json_gem'
else
  require "json"
end

class Shop < ActiveRecord::Base
  belongs_to :merchant
  has_many :products
  has_many :rooms
  has_many :orders
  has_many :categories
  has_many :workers
  has_many :food_materials

  mount_uploader :avatar, ImageUploader
  attr_accessor :uploader_secure_token

  after_save :update_geocoder
  def update_geocoder
    response = RestClient.get "http://api.map.baidu.com/geocoder/v2/" +
                              "?ak=#{Setting.baidu_map_ak}" +
                              "&output=json" +
                              "&address=#{self.address}" +
                              "&city=#{ChinaCity.get(self.city)}"
    result = JSON.parse(response.force_encoding("UTF-8").gsub(/[\u0011-\u001F]/, ""))
    if result["status"] == 0
      update_attributes(:lat => result["result"]["location"]["lat"], :lng => result["result"]["location"]["lng"])
    end
  end
end
