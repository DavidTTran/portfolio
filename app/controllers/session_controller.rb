class SessionController < ApplicationController
  def new
    redirect_to '/auth/github'
  end

  def create
    require "pry"; binding.pry
  end

  def destroy
    session.delete(:uid)
    redirect_to root_path
  end

  private

  def authorize_params
    request.env.fetch('omniauth.auth')
  end
end
