Rails.application.routes.draw do

  resource :wechat, only: [:show, :create]
  resource :wechat, only: [:show, :create]
  resource :weixin do
    collection do
      get :authorize
    end
  end

  namespace :admin do
    resources :shops
    resources :orders
    resources :jc_logs, only: [:index, :destroy]
    resources :sessions, only: [:new, :create, :destroy]
    resources :registrations
    resources :wechat
  end

  require 'dispatch'
  mount Api::Dispatch => '/api'
  mount WeixinRailsMiddleware::Engine, at: "/"
  mount StatusPage::Engine, at: '/'

  get 'china_city/:id', to: 'city_data#show'
  get 'welcome/api'
  get 'welcome/index'
  get 'welcome/downapp'
  get 'welcome/apply'
  post 'welcome/applied'
  post "pay_notify" => "orders#pay_notify"

  root :to => 'welcome#index'

  #match '*path', via: :all, to: 'welcome#error_404'

end
