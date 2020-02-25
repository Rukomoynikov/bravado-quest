# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create] do
        get 'search', on: :collection
        post 'sign_in', on: :collection
        get :info, on: :collection
      end
    end
  end

  root to: 'home#index'

  get '*path', to: 'home#index', constraints: lambda { |req|
    req.format.to_s == 'text/html' &&
      !req.path.start_with?('/api') &&
      !req.path.start_with?('/rails')
  }
end
