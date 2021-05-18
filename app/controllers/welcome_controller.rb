class WelcomeController < ApplicationController
  def index
    if User.where(visitor_id: current_visit.visitor_token).empty?
      current_user = User.create(visitor_id: current_visit.visitor_token)
    else
      current_user = User.find_by_visitor_id(current_visit.visitor_token)
    end
    @visitor = Visitor.new(current_user)
  end

  def update
    Visitor.new(current_user).oauth(params)
    redirect_to "/comments"
  end
end
