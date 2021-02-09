class ListSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :user
  attributes :movies

  def movies 
    custom_movies = []
  
    object.movies.map do |movie| 
      custom_movie = {}
      custom_movie[:id] = movie.id
      custom_movie[:title] = movie.title
      # custom_movie[:description] = movie.description
      # custom_movie[:search_id] = movie.search_id
      custom_movies.push(custom_movie)
    end 
    return custom_movies
  end 

end
