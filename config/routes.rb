Rails.application.routes.draw do

  mount WeixinRailsMiddleware::Engine, at: "/"

  resource :wechat, only: [:show] do
    collection do
      get :products
      get :product
    end
  end

  namespace :admin do
    resources :market_products
    resources :shops
    resources :orders
    resources :market_categories
    resources :jc_logs, only: [:index, :destroy]
  end

  devise_for :admins, controllers: {
    sessions: "admins/sessions"
  }

  require 'dispatch'
  mount Api::Dispatch => '/api'

  get 'china_city/:id', to: 'city_data#show'
  get 'welcome/api'

end
