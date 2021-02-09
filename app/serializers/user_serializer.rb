class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email

  has_many :lists
  has_many :movie_choices, through: :lists

end
