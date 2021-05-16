class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by_visitor_id(current_visit[:visitor_token]) if current_visit
  end
end
