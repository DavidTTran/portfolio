class OauthsController < ApplicationController
  def google_auth
    access_token = request.env['omniauth.auth']
  end

  def error
  end
end
