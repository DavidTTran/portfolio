Rails.application.routes.draw do
  root "welcome#index"
  get "/about", to: "about#index"
  get "/openai", to: "openai#index"
  get "/contact", to: "contact#index"
  get "/comments", to: "comments#index"

  get '/auth/:provider/callback', to: 'welcome#update'
end
