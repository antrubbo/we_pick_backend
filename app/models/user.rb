class User < ApplicationRecord
    has_many :lists, dependent: :destroy
    has_many :movie_choices, through: :lists
    
    validates :username, :email, presence: true
    validates :email, uniqueness:
    {message: 'An account associated with %{value} already exists'}

    after_create :create_list
    before_update :validate_update

    private

    def create_list
        List.create!(user_id: self.id)
    end      

    def validate_update
        if self.username.nil? || self.email.nil?
            self.errors
        end
    end

end
