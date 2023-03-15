class AddLibraryToReadersCards < ActiveRecord::Migration[7.0]
  def change
    add_reference :readers_cards, :library, null: false, foreign_key: true
  end
end
