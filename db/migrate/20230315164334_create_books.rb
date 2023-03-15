class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.string :isbn
      t.integer :publication_year

      t.timestamps
    end
  end
end
