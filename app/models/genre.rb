class Genre < ApplicationRecord
  has_and_belongs_to_many :books , dependent: :destroy

  validates :genre, presence: true
  #validates_associated :books

  def self.insert_100
    (1..100).each do |x|
      ActiveRecord::Base.connection.execute("INSERT INTO genres(genre, created_at, updated_at) VALUES(\"Genre#{x}\", CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)")
    end
  end

  def update_genre(genre)
    ActiveRecord::Base.connection.execute("UPDATE genres SET genre = \"#{genre}\", updated_at = CURRENT_TIMESTAMP WHERE id = #{self.id}")
    self.genre=genre
    self.updated_at = Time.now.strftime('%Y-%m-%d %H:%M:%S')
  end
end
