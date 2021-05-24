Rails.application.routes.draw do
  root "welcome#index"
  get "/about", to: "about#index"
  get "/openai", to: "openai#index"
  get "/contact", to: "contact#index"
  get "/comments", to: "comments#index"
  post "/comments", to: "comments#create"

  get '/auth/:provider/callback', to: 'welcome#update'
  get 'auth/google_oauth2/callback', to: 'oauths#google_auth'
  get 'auth/failure', to: 'oauths#error'
end
