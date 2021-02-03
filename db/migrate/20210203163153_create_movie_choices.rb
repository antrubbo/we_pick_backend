class CreateMovieChoices < ActiveRecord::Migration[6.0]
  def change
    create_table :movie_choices do |t|
      t.belongs_to :list, null: false, foreign_key: true
      t.belongs_to :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
