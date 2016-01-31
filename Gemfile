source 'https://ruby.taobao.org'

gem 'rails', '~> 4.2.5'
gem 'sprockets', '~> 3.3.3'

# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem "pg"

# locations
gem 'rgeo', '0.5.2'
gem 'rgeo-activerecord'
gem 'activerecord-postgis-adapter', '3.1.0'

gem 'rails-deprecated_sanitizer'

gem 'responders', '~> 2.0'

gem 'redis', '~> 3.2.1'
gem 'hiredis', '~> 0.6.0'
# Redis 命名空间
gem 'redis-namespace', '~> 1.5.1'
# 将一些数据存放入 Redis
gem 'redis-objects', '1.1.0'

# 用户系统
gem 'devise'
gem 'devise-encryptable'
gem 'bcrypt'

# 微信开发平台
gem 'weixin_rails_middleware'
gem 'weixin_authorize'

# 上传组件
gem 'carrierwave'
gem 'mini_magick'
gem 'carrierwave-upyun'
gem 'rest-client'
gem 'addressable'

gem 'activesupport-json_encoder'

# 分页
gem 'will_paginate', '3.0.7'

# 实现按某年，某月，某日，或者星期几，来查询数据
gem 'by_star', :git => "git://github.com/radar/by_star"

gem 'china_city'

# 短信
gem 'smart_sms'

# 实时通知
gem 'message_bus'

# 推送
gem 'jpush', :git => 'git://github.com/jpush/jpush-api-ruby-client.git'

# 枚举
gem 'enumerize'

# alipay
gem 'alipay', '~> 0.7.1'

# 搜索
gem 'rails-simple-search', '~> 0.9.9'

# Grape APIs
gem 'grape', '~> 0.13.0'
gem 'active_model_serializers'
gem 'grape-active_model_serializers'
gem 'hashie-forbidden_attributes'

# JWT
gem 'jwt'

# for api 跨域
gem 'rack-cors', require: 'rack/cors'

# Font Awesome
gem 'font-awesome-sass', '~> 4.3.1'

# YAML 配置信息
gem "settingslogic"

gem "puma", "2.15.3"

gem 'whenever', :require => false

gem 'rails_db'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'capistrano', '~> 3.2.0'
  gem 'capistrano-rails',   '~> 1.1', require: false
  gem 'capistrano-bundler', '~> 1.1', require: false
  gem 'capistrano-rbenv', '~> 2.0', require: false
  gem 'capistrano3-puma'
  gem 'memcache-client'
  gem 'rspec-rails', '~> 2.10.0'
  gem 'factory_girl_rails'
  gem 'capybara', :require => false
  gem 'letter_opener'
  gem 'thin'
  gem 'better_errors'            #出错提示友好版
  gem 'binding_of_caller'     #出错提示友好版

end

group :production do
  gem 'dalli'
end
