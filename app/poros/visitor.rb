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
    new_data = {
      username: data[:login],
      avatar_url: data[:avatar_url],
    }
    
    current_user.save_oauth("github", data[:html_url])
    current_user.update(new_data)
  end
end
