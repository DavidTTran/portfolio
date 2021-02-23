Rails.application.routes.draw do
  root "welcome#index"
  get "/session/new", as: :sign_in
  get "/auth/github/callback", action: :create, controller: "session"
  delete "/session", action: :destroy, controller: "session", as: :sign_out
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
