class Movie < ApplicationRecord
    has_many :movie_choices
    has_many :lists, through: :movie_choices
end
