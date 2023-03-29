class Author < ApplicationRecord
  has_and_belongs_to_many :books

  validates :first_name, :last_name, presence: true
  validates_associated :books

  def self.insert_100
    (1..100).each do |x|
      ActiveRecord::Base.connection.execute("INSERT INTO authors(first_name, last_name, created_at, updated_at) VALUES(\"FN#{x}\", \"LN#{x}\", CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)")
    end
  end

  def update_first_name(first_name)
    ActiveRecord::Base.connection.execute("UPDATE authors SET first_name = \"#{first_name}\", updated_at = CURRENT_TIMESTAMP WHERE id = #{self.id}")
    self.first_name =first_name
    self.updated_at = Time.now.strftime('%Y-%m-%d %H:%M:%S')
  end

  def update_last_name(last_name)
    ActiveRecord::Base.connection.execute("UPDATE authors SET last_name = \"#{last_name}\", updated_at = CURRENT_TIMESTAMP WHERE id = #{self.id}")
    self.last_name =last_name
    self.updated_at = Time.now.strftime('%Y-%m-%d %H:%M:%S')
  end
  
  end
