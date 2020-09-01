# frozen_string_literal: true

Rails.application.routes.draw do
  resources :bridges
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'top#index'
  get 'top/index'

  # admin
  namespace :admin do
    get 'sessions/index'
    post 'sessions/login'
    get 'sessions/logout'
    get 'top/index'
  end
end
