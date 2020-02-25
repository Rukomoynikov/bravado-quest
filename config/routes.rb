# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users do
        get 'search', on: :collection
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
