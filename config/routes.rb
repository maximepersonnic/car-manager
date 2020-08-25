# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :cars, only: :index do
    resources :transactions, only: :index
    resources :incomings, only: [:new, :create]
    resources :outgoings, only: [:new, :create]
    resources :mileages, only: [:new, :create]
  end

  resources :transactions, only: :destroy
end
