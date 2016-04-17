# required
WxPay.appid = 'wx799b2d765bf4b9ac'
WxPay.key = '12cb0b486187ff17e90a05edbdfcd837'
WxPay.mch_id = '1320744401'

# cert, see https://pay.weixin.qq.com/wiki/doc/api/app.php?chapter=4_3
# using PCKS12
# WxPay.set_apiclient_by_pkcs12(File.read(pkcs12_filepath), pass)

# optional - configurations for RestClient timeout, etc.
WxPay.extra_rest_client_options = {timeout: 2, open_timeout: 3}
