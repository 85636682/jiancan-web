Rails.application.routes.draw do

  namespace :admin do
  get 'orders/index'
  end

  namespace :admin do
  get 'orders/show'
  end

  namespace :admin do
  get 'orders/edit'
  end

  namespace :admin do
  get 'orders/update'
  end

  namespace :admin do
  get 'orders/destroy'
  end

  namespace :cpanel do
    get 'home/index'
    resources :shops, expect: :destroy
    resources :products
    resources :rooms
    resources :orders
    resources :categories
    resources :workers
    resources :market_products, only: [:index, :show]
  end

  devise_for :merchants, controllers: {
    sessions: "merchants/sessions"
  }

  namespace :admin do
    resources :market_products
    resources :shops
    resources :orders
  end

  devise_for :admins, controllers: {
    sessions: "admins/sessions"
  }

  mount ChinaCity::Engine => '/china_city'

  require 'dispatch'
  mount Api::Dispatch => '/api'
  
  get 'welcome/api'
  root "welcome#index"
end
