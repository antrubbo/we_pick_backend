class RemoveHomepageFromMovies < ActiveRecord::Migration[6.0]
  def change
    remove_column :movies, :homepage, :string
  end
end
