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
    update_visitor(data)
  end

  private

  def update_visitor(data)
    current_user.update(username: data[:login], avatar_url: data[:avatar_url])
  end
end
