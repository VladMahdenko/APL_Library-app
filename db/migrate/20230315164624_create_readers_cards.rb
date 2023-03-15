class CreateReadersCards < ActiveRecord::Migration[7.0]
  def change
    create_table :readers_cards do |t|
      t.date :issue_date

      t.timestamps
    end
  end
end
