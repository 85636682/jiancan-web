Rails.application.routes.draw do

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
  get '/', to: redirect'/index.html')
end
