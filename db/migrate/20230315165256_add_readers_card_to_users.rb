class AddReadersCardToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :readers_card, foreign_key: true
  end
end
