Rails.application.routes.draw do

  resource :wechat, only: [:show, :create]
  resource :weixin do
    collection do
      get :products
      get :product
      get :activity
      get :advertisement
      get :authorize
    end
  end

  namespace :admin do
    resources :shops
    resources :orders
    resources :jc_logs, only: [:index, :destroy]
    resources :sessions
    resources :registrations
    resources :wechat
  end

  require 'dispatch'
  mount Api::Dispatch => '/api'
  mount WeixinRailsMiddleware::Engine, at: "/"

  get 'china_city/:id', to: 'city_data#show'
  get 'welcome/api'
  get 'welcome/index'

  root :to => 'welcome#index'

end
