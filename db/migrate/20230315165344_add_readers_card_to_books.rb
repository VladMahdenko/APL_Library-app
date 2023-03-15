class AddReadersCardToBooks < ActiveRecord::Migration[7.0]
  def change
    add_reference :books, :readers_card, foreign_key: true
  end
end
