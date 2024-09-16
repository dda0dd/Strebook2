class Tag < ApplicationRecord
  has_many :book_store_tags, dependent: :destroy
  has_many :book_stores, through: :book_store_tags
end
