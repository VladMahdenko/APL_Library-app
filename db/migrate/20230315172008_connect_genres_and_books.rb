class ConnectGenresAndBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books_genres do |t|
    end
    add_reference :books_genres, :book, foreign_key: true
    add_reference :books_genres, :genre, foreign_key: true
  end
end
