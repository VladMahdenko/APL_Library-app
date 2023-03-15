class ReadersCard < ApplicationRecord
  belongs_to :library
  has_one :user
  has_many :books
end
