class AddZipCodeAndCityToLibraries < ActiveRecord::Migration[7.0]
  def change
    add_column :libraries, :zip_code, :string
    add_column :libraries, :city, :string
  end
end
