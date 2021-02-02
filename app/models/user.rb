class User < ApplicationRecord
  has_many :visits, class_name: "Ahoy::Visit"
end
