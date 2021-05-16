class Comment < ApplicationRecord

  def author
    User.find(self.user_id).username
  end
end
