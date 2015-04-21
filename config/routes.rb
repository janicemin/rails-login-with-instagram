Rails.application.routes.draw do
  get '/', to: 'sessions#index'
  get '/oauth/connect', to: 'sessions#connect'
  get '/oauth/callback', to: 'sessions#callback'
  get '/logout', to: 'sessions#logout'
end
