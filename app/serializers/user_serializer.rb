class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :visitor_id, :username

  def username
  end
end
