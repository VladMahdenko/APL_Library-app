class ConnectAuthorsAndBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :authors_books do |t|
    end
    add_reference :authors_books, :author, foreign_key: true
    add_reference :authors_books, :book, foreign_key: true
  end
end
