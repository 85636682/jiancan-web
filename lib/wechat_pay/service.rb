require 'rest_client'
require 'active_support/core_ext/hash/conversions'

module WechatPay
  module service
    GATEWAY_URL = 'https://api.mch.weixin.qq.com'
    INVOKE_UNIFIEDORDER_REQUIRER_FIELDS = %i(body out_trade_no total_fee spbill_create_ip notify_url trade_type)

    def self.invoke_unifiedorder(params, options = {})
      params = {
        appid: options.delete(:appid) || WechatPay.appid,
        mch_id: options.delete(:mch_id) || WechatPay.mch_id,
        nonce_str: SecureRandom.uuid.tr('-', '')
      }.merge(params)

      check_required_options(params, INVOKE_UNIFIEDORDER_REQUIRER_FIELDS)

      r = invoke_remote("#{GATEWAY_URL}/pay/unifiedorder", make_payload(params), options)

      yield r if block_given?

      r
    end

    class << self
      private

      def check_required_options(options, names)
        names.each do |name|
          warn("WeichatPay Warn: missing required option: #{name}") unless options_has_key?(name)
        end
      end

      def make_payload(params)
        sign = WechatPay::Sign.generate(params)
        params.delete(:key) if params[:key]
        "<xml>#{params.map { |k, v| "<#{k}>#{v}</#{k}>" }.join}<sign>#{sign}</sign></xml>"
      end

      def invoke_remote(url, payload, options = {})
        options = WeichatPay.extra_rest_client_options.merge(options)

        r = RestClient::Request.execute(
          {
            method: :post,
            url: url,
            payload: payload,
            headers: { content_type: 'application/xml' }
          }.merge(options)
        )

        if r
          WechatPay::Result.new(Hash.from_xml(r))
        else
          nil
        end
      end
    end

  end
end
