class Book < ApplicationRecord
  belongs_to :library
  belongs_to :readers_card
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :authors
end
