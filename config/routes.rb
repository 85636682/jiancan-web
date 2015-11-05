Rails.application.routes.draw do

  namespace :cpanel do
    get 'home/index'
    get 'home/prices'
    get 'home/about'
    resources :shops, expect: :destroy
    resources :products
    resources :food_materials
    resources :rooms
    resources :orders do
      member do
        get :settle
        get :cancel
      end
      collection do
        get :search
      end
    end
    resources :order_products, only: [:new, :create, :destroy] do
      member do
        get :status
      end
    end
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
    resources :merchants, only: [:edit, :update] do
      collection do
        patch 'update_password'
      end
    end
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

  require 'dispatch'
  mount Api::Dispatch => '/api'

  get 'china_city/:id', to: 'city_data#show'
  get 'welcome/api'
  root "welcome#index"
end
