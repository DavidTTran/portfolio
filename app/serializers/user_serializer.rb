class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :visitor_id
end
