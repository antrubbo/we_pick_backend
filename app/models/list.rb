class List < ApplicationRecord
  belongs_to :user
  has_many :movie_choices
  has_many :movies, through: :movie_choices
end
