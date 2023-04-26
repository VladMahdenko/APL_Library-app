namespace :parser do
  desc "Parses List of Libraries from Wikipedia to database"
  task parse_html: :environment do
    require 'open-uri'
    require 'nokogiri'

    html = URI.open("https://en.wikipedia.org/wiki/List_of_libraries").read
    doc = Nokogiri::HTML(html)
    array = doc.xpath("//a")
    array.each do |el|
      if el.text.include? "Library"
        Library.new(name: el.text, address: el.text + " address").save
      end
    end
  end

  task parse_csv: :environment do
    require 'csv'

    data = CSV.open("files/libraries_6.csv", "r", headers: true)
    data.each do |row|
      Library.new(name: row["Library Name"], address: row["Street Address"], zip_code: row["Zip Code"], city: row["City"]).save
    end
  end
end
