require 'digest/md5'

module WechatPay
  module Sign
    def self.generate(params)
      key = params.delete(:key)

      query = params.sort.map do |key, value|
        "#{key}=#{value}" if value != "" && !value.nil?
      end.compact.join('&')

      Digest::MD5.hexdigest("#{query}&key=#{key || WechatPay.key}").upcase
    end

    def self.verify?(params)
      params = params.dup
      sign = params.delete('sign') || params.delete(:sign)

      generate(params) == sign
    end
  end
end
