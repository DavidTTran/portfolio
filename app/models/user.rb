class User < ApplicationRecord
  has_many :visits, class_name: "Ahoy::Visit"

  before_save do
    username_generator
  end

  private

  def username_generator
    self.username = "visitor-#{srand.to_s.last(4)}"
    return if User.where(username: self.username).empty?
    username_generator
  end
end
