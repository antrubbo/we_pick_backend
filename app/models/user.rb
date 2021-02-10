class User < ApplicationRecord
    has_many :lists, dependent: :destroy
    has_many :movie_choices, through: :lists

    after_create :create_list

    validates :username, :email, presence: true
    validates :email, uniqueness:
        {message: 'An account associated with %{value} already exists'}

    private

    def create_list
        List.create!(user_id: self.id)
    end      

end
