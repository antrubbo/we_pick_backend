class User < ApplicationRecord
    has_many :lists, dependent: :destroy

    validates :username, :email, presence: true
    validates :email, uniqueness:
        {message: 'An account associated with %{value} already exists'}
end
