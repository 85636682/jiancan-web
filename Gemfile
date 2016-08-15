source 'https://ruby.taobao.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0'
gem 'sprockets'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'turbolinks', '~> 5'

gem 'bootstrap'
gem 'rails-assets-tether'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem "pg"

# locations
gem 'rgeo'
gem 'rgeo-activerecord'
gem 'activerecord-postgis-adapter'

gem 'rails-deprecated_sanitizer'

gem 'responders'

gem 'redis'
gem 'hiredis'
# Redis 命名空间
gem 'redis-namespace'
# 将一些数据存放入 Redis
gem 'redis-objects'

# 用户系统
gem 'bcrypt'

# 微信开发平台
gem 'weixin_rails_middleware'
gem 'weixin_authorize'
gem 'wx_pay', :git => 'git://github.com/jasl/wx_pay'
gem 'wechat'

# 上传组件
gem 'carrierwave'
gem 'mini_magick'
gem 'carrierwave-upyun'
gem 'rest-client'
gem 'addressable'

# 分页
gem 'will_paginate'

# 实现按某年，某月，某日，或者星期几，来查询数据
gem 'by_star', :git => "git://github.com/radar/by_star"

# 实时通知
gem 'message_bus'



# 枚举
gem 'enumerize'

# alipay
gem 'alipay'

# 搜索
gem 'rails-simple-search'

# Grape APIs
gem 'grape'
gem 'active_model_serializers'
gem 'grape-active_model_serializers'
gem 'hashie-forbidden_attributes'

# JWT
gem 'jwt'

# for api 跨域
gem 'rack-cors', require: 'rack/cors'

# Font Awesome
gem 'font-awesome-sass'

# YAML 配置信息
gem "settingslogic"

gem "puma", "~> 3"

gem 'whenever', :require => false

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# HTTP Client
gem 'faraday', '~> 0.9.2'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  gem 'web-console'
  gem 'spring'
  gem 'capistrano'
  gem 'capistrano-rails', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rbenv', require: false
  gem 'capistrano3-puma'
  gem 'memcache-client'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'capybara', :require => false
  gem 'letter_opener'
  gem 'thin'
  gem 'better_errors'            #出错提示友好版
  gem 'binding_of_caller'     #出错提示友好版
  gem 'rails_db'
end

# 推送
gem 'jpush'

group :production do
  gem 'dalli'
end
