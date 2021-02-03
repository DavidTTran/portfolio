class Users
  attr_reader :current_user, :users

  def initialize(current_user)
    @current_user = current_user
    @users = User.all
  end

  def count
    @users.size
  end
end
