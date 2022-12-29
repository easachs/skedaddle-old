# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'
  get '/auth/:provider/callback', to: 'sessions#omniauth'
  get '/dashboard', to: 'dashboard#show'
  delete '/sessions', to: 'sessions#destroy'
  get '/about', to: 'dashboard#about_us'
  get '/contact', to: 'dashboard#contact'
  resources :itineraries, except: %i[edit update]
end
