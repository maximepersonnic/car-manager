# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root to: 'cars#index'

  resources :cars, only: [] do
    resources :transactions, only: :index
    resources :incomings, only: [:new, :create]
    resources :outgoings, only: [:new, :create]
    resources :mileages, only: [:new, :create]
    resources :maintenances, only: [:index, :new, :create]
  end

  resources :maintenances, only: :destroy
  resources :operations, only: [:index, :new, :create, :destroy]
  resources :transactions, only: :destroy
end
