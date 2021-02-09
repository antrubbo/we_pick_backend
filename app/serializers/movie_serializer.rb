class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :release_date, :genres, :runtime, :video_key, :search_id
end
