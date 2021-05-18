class User < ApplicationRecord
  has_many :visits, class_name: "Ahoy::Visit"

  before_create :generate_username, :default_avatar

  def generate_username
    self.username = "visitor-#{srand.to_s.last(4)}"
    return if User.where(username: self.username).empty?
    generate_username
  end

  def default_avatar
    self.avatar_url = "https://imgur.com/C91oByQ"
  end
end
