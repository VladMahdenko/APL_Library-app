class Library < ApplicationRecord
  has_many :books
  has_many :readers_cards
end
