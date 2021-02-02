class WelcomeController < ApplicationController
  def index
    if !User.where(visitor_id: current_visit.visitor_token)
      User.create(visitor_id: current_visit.visitor_token)
    end
    render json: UserSerializer.new(User.all)
  end

  def new
  end
end
