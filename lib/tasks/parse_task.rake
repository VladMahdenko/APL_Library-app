namespace :parser do
  desc "Parses List of Libraries from Wikipedia to database"
  task parse: :environment do
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
end