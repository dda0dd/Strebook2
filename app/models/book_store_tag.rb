class BookStoreTag < ApplicationRecord
  belongs_to :book_store
  belongs_to :tag
end
