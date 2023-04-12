class AddNumberToReadersCard < ActiveRecord::Migration[7.0]
  def change
    add_column :readers_cards, :number, :string
  end
end
