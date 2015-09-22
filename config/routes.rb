Rails.application.routes.draw do

  namespace :cpanel do
    get 'home/index'
    resources :shops, expect: :destroy
    resources :products
    resources :rooms
    resources :orders
    resources :categories
    resources :workers
    resources :market_products, only: [:index, :show]
    resources :notifications, only: [:index, :destroy] do
      member do
        get :read
      end
      collection do
        get :read_all
        get :clear
      end
    end
    resources :cart, only: [:index, :create, :update, :destroy]
    resources :market_orders, only: [:index, :show, :create, :destroy]
  end

  devise_for :merchants, controllers: {
    sessions: "merchants/sessions"
  }

  namespace :admin do
    resources :market_products
    resources :shops
    resources :orders
    resources :market_categories
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
