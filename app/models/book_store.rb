class BookStore < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  validates :name, presence: true
  validates :age, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true
  validates :password, length: { minimum: 8 }, on: :create

  has_many :posts, dependent: :destroy
  has_many :book_store_tags, dependent: :destroy
  has_many :tags, through: :book_store_tags

  def self.guest
    find_or_create_by!(name: "guestbook_store", age: 1879) do |book_store|
      book_store.password = SecureRandom.urlsafe_base64
      book_store.name = "guestbook_store"
      book_store.address = "大阪府〇〇市〇〇町7-6-11"
      book_store.telephone_number = "072-0000-0000"
      book_store.email = "book_store@guest"
      book_store.tags.build(name: "イベント")
      book_store.tags.build(name: "カフェ併設")
    end
  end

  def guest?
    name == "guestbook_store"
  end

  def save_tags(tags)
    tag_list = tags.split(/[[:blank:]]+/)
    current_tags = self.tags.pluck(:name)
    old_tags = current_tags - tag_list
    new_tags = tag_list - current_tags
    old_tags.each do |old|
      self.tags.delete Tag.find_by(name: old)
    end

    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(name: new)
      self.tags << new_post_tag
    end
  end

  def active?
    is_active
  end

  def withdrawn?
    !is_active
  end

  has_one_attached :image
end
