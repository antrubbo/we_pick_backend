class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :release_date, :genres, :runtime, :video_key, :poster_path, :search_id, :homepage
end
