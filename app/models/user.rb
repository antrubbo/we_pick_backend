class User < ApplicationRecord
    has_many :lists, dependent: :destroy
    has_many :movie_choices, through: :lists

    validates :username, :email, presence: true
    validates :email, uniqueness:
        {message: 'An account associated with %{value} already exists'}
end
