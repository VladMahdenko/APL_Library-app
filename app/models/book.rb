class Book < ApplicationRecord
  belongs_to :library
  belongs_to :readers_card
end
