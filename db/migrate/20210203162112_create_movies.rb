class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :description
      t.string :release_date
      t.string :genres, array: true
      t.integer :runtime
      t.string :video_key, :default => ""
      t.string :poster_path
      t.integer :search_id
      t.string :homepage, :default => ""

      t.timestamps
    end
  end
end
