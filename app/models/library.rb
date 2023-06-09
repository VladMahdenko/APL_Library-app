class Library < ApplicationRecord
  paginates_per 10

  has_many :books, dependent: :destroy
  has_many :readers_cards, dependent: :destroy
  has_one_attached :image, dependent: :destroy

  validates :address, :name, presence: true

  def self.insert_100
    (1..100).each do |x|
      ActiveRecord::Base.connection.execute("INSERT INTO libraries(name, address, created_at, updated_at) VALUES (\"Name #{x}\", \"Address #{x}\", CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)")
    end
  end

  def update_name(name)
    ActiveRecord::Base.connection.execute("UPDATE libraries SET name = \"#{name}\", updated_at = CURRENT_TIMESTAMP WHERE id = #{self.id}")
    self.name = name
    self.updated_at = Time.now.strftime('%Y-%m-%d %H:%M:%S')
  end

  def update_address(address)
    ActiveRecord::Base.connection.execute("UPDATE libraries SET address = \"#{address}\", updated_at = CURRENT_TIMESTAMP WHERE id = #{self.id}")
    self.address = address
    self.updated_at = Time.now.strftime('%Y-%m-%d %H:%M:%S')
  end
end
