class User < ApplicationRecord
  has_many :visits, class_name: "Ahoy::Visit"
  has_many :comments
  has_many :oauths

  before_create :generate_username, :default_avatar

  def generate_username
    self.username = "visitor-#{srand.to_s.last(4)}"
    return if User.where(username: self.username).empty?
    generate_username
  end

  def default_avatar
    self.avatar_url = "https://i.imgur.com/C91oByQ.png"
  end

  def save_oauth(provider, url)
    oauth = Oauth.find_or_initialize_by(user: self, provider: provider)
    if oauth.url != url
      oauth.url = url
    end
    oauth.save
  end
end
