class Book < ApplicationRecord
  belongs_to :library
  belongs_to :readers_card
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :authors

  validates :title, :description, :isbn, :publication_year, :library_id, :readers_card_id, presence: true
  validates_associated :authors, :readers_card, :genres, :library

  def self.insert_100
    (1..100).each do |x|
      self.new(title: "TL#{x}", description: "DS#{x}", isbn: "ISBN#{x}", publication_year: 2023, library: Library.last, readers_card: ReadersCard.last).save
    end
  end

  def update_title(title)
    self.title=title
    self.updated_at = Time.now.strftime('%Y-%m-%d %H:%M:%S')
    self.save()
  end

  def update_description(description)
    self.description=description
    self.updated_at = Time.now.strftime('%Y-%m-%d %H:%M:%S')
    self.save()
  end

  def update_isbn(isbn)
    self.isbn=isbn
    self.updated_at = Time.now.strftime('%Y-%m-%d %H:%M:%S')
    self.save()
  end

  def update_publication_year(publication_year)
    self.publication_year=publication_year
    self.updated_at = Time.now.strftime('%Y-%m-%d %H:%M:%S')
    self.save()
  end

  def update_library(library)
    self.library=library
    self.updated_at = Time.now.strftime('%Y-%m-%d %H:%M:%S')
    self.save()
  end

  def update_readers_card(readers_card)
    self.readers_card=readers_card
    self.updated_at = Time.now.strftime('%Y-%m-%d %H:%M:%S')
    self.save()
  end

end
