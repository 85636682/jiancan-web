Rails.application.routes.draw do

  namespace :cpanel do
    get 'home/index'
    resources :shops, expect: :destroy
    resources :products
    resources :rooms
    resources :orders
    resources :categories
    resources :workers
  end

  devise_for :merchants, controllers: {
    sessions: "merchants/sessions"
  }

  mount ChinaCity::Engine => '/china_city'

  require 'dispatch'
  mount Api::Dispatch => '/api'
  
  get 'welcome/api'
  root "welcome#index"
end
