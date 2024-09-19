class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :book_store
  has_many :thoughtse_comments, dependent: :destroy

  def guest?
    name == "guestbook_store"
  end
end
