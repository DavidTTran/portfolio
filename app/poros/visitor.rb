class Visitor
  attr_reader :current_user

  def initialize(current_user = nil)
    @current_user = current_user
  end

  def count_of_visitors
    User.all.size
  end

  def oauth(params)
    data = GithubService.new.call(params)
  end
end
